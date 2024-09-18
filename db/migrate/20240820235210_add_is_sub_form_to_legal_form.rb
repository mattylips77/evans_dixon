class AddIsSubFormToLegalForm < ActiveRecord::Migration[7.1]
  def change
    add_column :legal_forms, :isSubForm, :boolean
  end
end
