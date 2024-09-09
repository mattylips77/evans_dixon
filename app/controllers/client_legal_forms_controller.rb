require 'csv'

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
    @client_legal_form_id = params[:id]
  end

  # GET /client_legal_forms/new
  def new
    @client_dropdown = Client.all.map { |client| [client.first_name, client.id] }
    @client_legal_form = ClientLegalForm.new
    @legal_form_dropdown = LegalForm.where(isSubform: false).map { |legal_form| [legal_form.name, legal_form.id] }
  end

  def new_for_client
    @client = Client.find(params[:id])
    @client_legal_form = ClientLegalForm.new
    @legal_form_dropdown = LegalForm.all.map { |legal_form| [legal_form.name, legal_form.id] }
  end

  def forms_by_client
    @client = Client.find(params[:id])
    @client_legal_forms = ClientLegalForm.where(client_id: params[:id])
  end

  def sub_form
    @test= "mytest"
  end

  # GET /client_legal_forms/1/edit
  def edit
  end

  # POST /client_legal_forms or /client_legal_forms.json
  def create
    @client_legal_form = ClientLegalForm.new(client_legal_form_params)

    form_hash = generateHash
    @client_legal_form.form_hash = form_hash

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
        format.html { redirect_to client_legal_forms_path, notice: "Client legal form was successfully created." }
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
    unless params[:stimulus]
      respond_to do |format|
        format.html { redirect_to client_legal_forms_url, notice: "Client legal form was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  def download_csv
    respond_to do |format|
      @ClientAnswer = ClientAnswer.where(client_legal_form_id: params[:formID])
      @ClientLegalForm = ClientLegalForm.find(params[:formID])
      format.csv { send_data generate_csv(@ClientAnswer), filename: "completed_form-#{@ClientLegalForm.most_recent_login.strftime("%Y-%m-%d_%H-%M")}.csv" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_legal_form
      @client_legal_form = ClientLegalForm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_legal_form_params
      params.require(:client_legal_form).permit(:client_id, :legal_form_id, :first_login_date, :most_recent_login, :form_hash, :subFormQuestion_id, :stimulus)
    end

    def generateHash
      @random_string = SecureRandom.alphanumeric(36)
      if ClientLegalForm.where(:form_hash => @random_string).count > 0
        @random_string = generateHash
      end
      @random_string
    end

  def generate_csv(client_answers)
    CSV.generate(headers: true) do |csv|
      csv << ["Question", "Answer"] # Add your desired headers

      client_answers.each do |client_answer|
        csv << [client_answer.question, client_answer.answer] # Add your desired fields
      end
    end
  end
end
