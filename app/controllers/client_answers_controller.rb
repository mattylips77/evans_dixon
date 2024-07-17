class ClientAnswersController < ApplicationController
  before_action :set_client_data_entry, only: %i[ show edit update destroy ]

  # GET /client_data_entries or /client_data_entries.json
  # def index
  #
  # end


  # GET /client_data_entries/1 or /client_data_entries/1.json
  def show
    client_legal_form = ClientLegalForm.where(form_hash: params[:id])
    if client_legal_form.count > 0
      @client_data_entry = ClientLegalForm.find(client_legal_form.first.id)
      @client_data_entry.client_answers.build if @client_data_entry.client_answers.empty?
    else
      redirect_to("/hashError")
    end
  end

  # GET /client_data_entries/new
  def new
    @client_data_entry = ClientDataEntry.new
  end

  # GET /client_data_entries/1/edit
  def edit
  end

  # POST /client_data_entries or /client_data_entries.json
  def create
    @client_data_entry = ClientDataEntry.new(client_data_entry_params)

    respond_to do |format|
      if @client_data_entry.save
        format.html { redirect_to client_data_entry_url(@client_data_entry), notice: "Client data entry was successfully created." }
        format.json { render :show, status: :created, location: @client_data_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_data_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_data_entries/1 or /client_data_entries/1.json
  def update
    # puts "start update"
    # params[:client_legal_form][:client_answers_attributes].each\\ do
    #   puts
    # respond_to do |format|
    #   if @client_data_entry.update(client_data_entry_params)
    #     format.html { redirect_to client_data_entry_url(@client_data_entry), notice: "Client data entry was successfully updated." }
    #     format.json { render :show, status: :ok, location: @client_data_entry }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @client_data_entry.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /client_data_entries/1 or /client_data_entries/1.json
  def destroy
    @client_data_entry.destroy!

    respond_to do |format|
      format.html { redirect_to client_data_entries_url, notice: "Client data entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_client_data_entry
    # @client_data_entry = ClientDataEntry.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_data_entry_params
    params.require(:client_legal_form).permit(client_answers_attributes: [:answer])
  end
end
