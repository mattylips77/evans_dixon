class ClientLegalForm < ApplicationRecord
  belongs_to :client
  belongs_to :legal_form
  has_many :client_answers, dependent: :destroy
  accepts_nested_attributes_for :client_answers, allow_destroy: true
end
