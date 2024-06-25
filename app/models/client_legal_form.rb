class ClientLegalForm < ApplicationRecord
  belongs_to :client
  belongs_to :legal_form
  has_many :client_answers
end
