class AddSubFormToLegalFormQuestion < ActiveRecord::Migration[7.1]
  def change
    add_reference :legal_form_questions, :subForm, foreign_key: {to_table: :legal_forms}
  end
end
