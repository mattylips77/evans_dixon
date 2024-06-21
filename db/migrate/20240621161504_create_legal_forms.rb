class CreateLegalForms < ActiveRecord::Migration[7.1]
  def change
    create_table :legal_forms do |t|
      t.string :name

      t.timestamps
    end
  end
end
