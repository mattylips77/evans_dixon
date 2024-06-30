class ClientLegalFormsController < ApplicationController
  before_action :set_client_legal_form, only: %i[ show edit update destroy ]

  # GET /client_legal_forms or /client_legal_forms.json
  def index
    @client_legal_forms = ClientLegalForm.all
  end

  # GET /client_legal_forms/1 or /client_legal_forms/1.json
  def show
    client_legal_form = ClientLegalForm.find(params[:id])
    @answers = ClientAnswer.where(client_legal_form_id: params[:id])
  end

  def userEdit
    client_legal_form_id = ClientLegalForm.where(form_hash: params[:id]).first.id
    puts "legal_form_id"
    puts client_legal_form_id
    @client_legal_form_input = ClientLegalForm.find(client_legal_form_id)
    @client_legal_form_input.client_answers.build if @client_legal_form_input.client_answers.empty?
  end

  # GET /client_legal_forms/new
  def new
    @client_legal_form = ClientLegalForm.new
    @client_dropdown = Client.all.map { |client| [client.first_name, client.id] }
    @legal_form_dropdown = LegalForm.all.map { |legal_form| [legal_form.name, legal_form.id] }
  end

  # GET /client_legal_forms/1/edit
  def edit
  end

  # POST /client_legal_forms or /client_legal_forms.json
  def create
    @client_legal_form = ClientLegalForm.new(client_legal_form_params)
    puts "client legal form"
    puts @client_legal_form
    legal_form_questions = LegalFormQuestion.where(legal_form_id: client_legal_form_params['legal_form_id'])
    respond_to do |format|
      if @client_legal_form.save
        legal_form_questions.each do |legal_form|
          client_answer = ClientAnswer.new({:question => legal_form.question,
                                            :position => legal_form.position,
                                            :options => legal_form.options,
                                            :question_type => legal_form.question_type,
                                            :client_legal_form_id => @client_legal_form.id
                                           })
          puts "new client answer"
          puts client_answer
          if client_answer.save
            puts "client answer saved"
          else
            puts "client answer not saved"
            puts client_answer.errors
          end
        end
        format.html { redirect_to client_legal_form_url(@client_legal_form), notice: "Client legal form was successfully created." }
        format.json { render :show, status: :created, location: @client_legal_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_legal_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_legal_forms/1 or /client_legal_forms/1.json
  def update
    respond_to do |format|
      if @client_legal_form.update(client_legal_form_params)
        format.html { redirect_to client_legal_form_url(@client_legal_form), notice: "Client legal form was successfully updated." }
        format.json { render :show, status: :ok, location: @client_legal_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_legal_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_legal_forms/1 or /client_legal_forms/1.json
  def destroy
    @client_legal_form.destroy!

    respond_to do |format|
      format.html { redirect_to client_legal_forms_url, notice: "Client legal form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_legal_form
      @client_legal_form = ClientLegalForm.find(params[:id])
      puts 'before matt test'
    end

    # Only allow a list of trusted parameters through.
    def client_legal_form_params
      params.require(:client_legal_form).permit(:client_id, :legal_form_id, :first_login_date, :most_recent_login, :form_hash)
    end
end
