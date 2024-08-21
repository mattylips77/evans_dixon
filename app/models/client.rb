class Client < ApplicationRecord
  has_many :client_legal_forms, dependent: :destroy
end
