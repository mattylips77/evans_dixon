class ClientDataEntriesController < ApplicationController
  def show
    client_legal_form = ClientLegalForm.where(form_hash: params[:id])
    if client_legal_form.count > 0
      @client_data_entry = ClientLegalForm.find(client_legal_form.first.id)
      @client_data_entry.client_answers.build if @client_data_entry.client_answers.empty?
    else
      redirect_to("/hashError")
    end
  end

  def update
    puts 'output test'
    params[:client_legal_form][:client_answers_attributes].each do |answer|
      @ClientAnswer =  ClientAnswer.find(answer[1][:id])
      @ClientAnswer.answer = answer[1][:answer]
      @ClientAnswer.save
    end
    redirect_to("/clientSuccess")
  end

  def client_answer_params
    params.require(:client_answer).permit(:answer)
  end
end
