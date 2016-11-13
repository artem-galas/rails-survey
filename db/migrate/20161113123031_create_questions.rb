class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :question_type
      t.integer :survey_id

      t.timestamps
    end
  end
end
