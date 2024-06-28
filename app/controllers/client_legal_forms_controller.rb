class ClientLegalFormsController < ApplicationController
  before_action :set_client_legal_form, only: %i[ show edit update destroy ]

  # GET /client_legal_forms or /client_legal_forms.json
  def index
    @client_legal_forms = ClientLegalForm.all
  end

  # GET /client_legal_forms/1 or /client_legal_forms/1.json
  def show
    # @questions =  ClientLegalForm.find(params[:id]).legal_form.legal_form_questions.all.left_joins(:client_answers)
    #.select('legal_form_questions.question, legal_form_questions.position, client_answers.answer')
    @questions = ActiveRecord::Base.connection.execute("SELECT name, position, question, answer from client_legal_forms
                                                            JOIN legal_forms ON legal_forms.id = client_legal_forms.legal_form_id
                                                            JOIN legal_form_questions ON legal_forms.id = legal_form_questions.legal_form_id
                                                            LEFT JOIN client_answers ON legal_form_questions.id = client_answers.legal_form_question_id AND client_legal_forms.id = client_answers.id
                                                            WHERE client_legal_forms.id = #{params[:id]}")
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

    respond_to do |format|
      if @client_legal_form.save
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
    end

    # Only allow a list of trusted parameters through.
    def client_legal_form_params
      params.require(:client_legal_form).permit(:client_id, :legal_form_id, :first_login_date, :most_recent_login)
    end
end
