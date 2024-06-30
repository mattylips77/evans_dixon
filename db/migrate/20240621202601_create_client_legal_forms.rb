class CreateClientLegalForms < ActiveRecord::Migration[7.1]
  def change
    create_table :client_legal_forms do |t|
      t.references :client, null: false, foreign_key: true
      t.references :legal_form, null: false, foreign_key: true
      t.string :form_hash
      t.datetime :first_login_date
      t.datetime :most_recent_login

      t.timestamps
    end
  end
end
