class LegalFormQuestion < ApplicationRecord
  belongs_to :legal_form
  has_many :client_answers
end
