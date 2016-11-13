class AddQuestionRefToQuestionOption < ActiveRecord::Migration[5.0]
  def change
    add_reference :question_options, :question, foreign_key: true
  end
end
