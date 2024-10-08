class ClientDataEntriesController < ApplicationController
  layout "overlay", only: [:sub_form, :sub_form_list]
  def show
    client_legal_form = ClientLegalForm.where(form_hash: params[:id])
    if client_legal_form.count > 0
      @client_data_entry = ClientLegalForm.find(client_legal_form.first.id)
      # @client_data_entry.client_answers.build if @client_data_entry.client_answers.empty?

    else
      redirect_to("/hashError")
    end
  end

  def sub_form
    @client_data_entry = ClientLegalForm.find(params[:id])
  end

  def sub_form_list
    @subform_list = ClientLegalForm.where(subFormQuestion_id: params[:id])
  end

  def update
    puts 'update - client answers'
    puts params[:client_legal_form]
    puts params[:client_legal_form][:client_answers_attributes]
    params[:client_legal_form][:client_answers_attributes].each do |answer|
      puts 'saveing asnwers'
      puts answer[1]
      @ClientAnswer =  ClientAnswer.find(answer[1][:id])
      @ClientAnswer.answer = answer[1][:answer]
      puts 'answer updated'
      puts @ClientAnswer.answer
      puts @ClientAnswer.save
      puts @ClientAnswer.errors.full_messages.join(", ")
    end

    @ClientLegalForm = ClientLegalForm.where(form_hash: params[:id])[0]

    if @ClientLegalForm.first_login_date.nil?
      @ClientLegalForm.first_login_date = Time.current
    end

    @ClientLegalForm.most_recent_login = Time.current
    @ClientLegalForm.save

    redirect_to("/clientSuccess")
  end

  def client_answer_params
    params.require(:client_answer).permit(:answer)
  end
end
