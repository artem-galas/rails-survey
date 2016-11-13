class Question < ApplicationRecord
  belongs_to :survey
  has_many :question_options
  accepts_nested_attributes_for :question_options, allow_destroy: true
  enum question_type:['Short Answer',
                      'Paragraph',
                      'One from list',
                      'Checkboxes', 'Select box',
                      'Date', 'Time']
end
