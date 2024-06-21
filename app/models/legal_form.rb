class LegalForm < ApplicationRecord
  has_many :legal_form_questions, dependent: :destroy

end
