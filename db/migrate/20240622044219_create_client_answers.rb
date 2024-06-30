class CreateClientAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :client_answers do |t|
      t.references :client_legal_form, null: false, foreign_key: true
      t.string :question
      t.integer :position
      t.string :question_type
      t.string :options
      t.string :answer

      t.timestamps
    end
  end
end
