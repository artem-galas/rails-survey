class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :update, :destroy]

  # GET /surveys
  def index
    @surveys = Survey.all

    render json: @surveys
  end

  # GET /surveys/1
  def show
    render json: @survey, include: {
        questions: [:question_options]
    }
  end

  # POST /surveys
  def create
    p"/" *10
    p survey_params
    p"/" *10

    @survey = Survey.new(survey_params)

    if @survey.save
      render json: @survey, status: :created, location: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /surveys/1
  def update
    if @survey.update(survey_params)
      render json: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_survey
      @survey = Survey.find(params[:id])
    end


    # Only allow a trusted parameter "white list" through.
    def survey_params
      sp = params.require(:survey).permit(:name, questions: [
          :text,:type,
          options: [
              :text
          ]
      ])

      sp[:questions_attributes] = sp.delete :questions
      sp[:questions_attributes].each do |ssp|
        ssp[:question_type] = ssp.delete :type
        ssp[:question_options_attributes] = ssp.delete :options
      end
      sp.permit!
    end
end
