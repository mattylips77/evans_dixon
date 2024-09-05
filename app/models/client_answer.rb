class ClientAnswer < ApplicationRecord
  belongs_to :client_legal_form
  belongs_to :legal_form, class_name: 'LegalForm', foreign_key: :subForm_id, optional: true
end
