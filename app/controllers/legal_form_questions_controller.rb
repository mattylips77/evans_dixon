class LegalFormQuestionsController < ApplicationController
  before_action :set_legal_form_question, only: %i[ show edit update destroy ]

  # GET /legal_form_questions or /legal_form_questions.json
  def index
    @legal_form_questions = LegalFormQuestion.all
  end

  # GET /legal_form_questions/1 or /legal_form_questions/1.json
  def show
  end

  # GET /legal_form_questions/new
  def new
    @legal_form_question = LegalFormQuestion.new
    @legal_form_dropdown = LegalForm.all.map { |legal_form| [legal_form.name, legal_form.id] }
  end

  # GET /legal_form_questions/1/edit
  def edit
  end

  # POST /legal_form_questions or /legal_form_questions.json
  def create
    @legal_form_question = LegalFormQuestion.new(legal_form_question_params)

    respond_to do |format|
      if @legal_form_question.save
        format.html { redirect_to legal_form_question_url(@legal_form_question), notice: "Legal form question was successfully created." }
        format.json { render :show, status: :created, location: @legal_form_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @legal_form_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legal_form_questions/1 or /legal_form_questions/1.json
  def update
    respond_to do |format|
      if @legal_form_question.update(legal_form_question_params)
        format.html { redirect_to legal_form_question_url(@legal_form_question), notice: "Legal form question was successfully updated." }
        format.json { render :show, status: :ok, location: @legal_form_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @legal_form_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legal_form_questions/1 or /legal_form_questions/1.json
  def destroy
    @legal_form_question.destroy!

    respond_to do |format|
      format.html { redirect_to legal_form_questions_url, notice: "Legal form question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal_form_question
      @legal_form_question = LegalFormQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def legal_form_question_params
      params.require(:legal_form_question).permit(:question, :question_type, :position, :options, :legal_form_id)
    end
end
