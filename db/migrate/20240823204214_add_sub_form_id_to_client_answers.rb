class AddSubFormIdToClientAnswers < ActiveRecord::Migration[7.1]
  def change
    add_reference :client_answers, :subForm,  foreign_key: { null: false, to_table: :legal_forms }
  end
end
