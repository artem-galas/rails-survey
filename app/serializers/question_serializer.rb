class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :text, :type, :options
  has_many :question_options

  def type
    object.question_type
  end

  def options
    object.question_options
  end
end
