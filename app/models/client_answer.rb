class ClientAnswer < ApplicationRecord
  belongs_to :client_legal_form
  belongs_to :legal_form_question
end
