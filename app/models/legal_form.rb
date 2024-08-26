class LegalForm < ApplicationRecord
  has_many :legal_form_questions, dependent: :destroy
  has_many :client_answers, foreign_key: :subForm_id
end
