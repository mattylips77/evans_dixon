class CreateLegalFormQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :legal_form_questions do |t|
      t.string :question
      t.string :question_type
      t.integer :position
      t.string :options
      t.references :legal_form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
