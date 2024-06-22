class LegalFormsController < ApplicationController
  before_action :set_legal_form, only: %i[ show edit update destroy ]

  # GET /legal_forms or /legal_forms.json
  def index
    @legal_forms = LegalForm.all
  end

  # GET /legal_forms/1 or /legal_forms/1.json
  def show
    @questions = LegalForm.find(params[:id]).legal_form_questions.all
  end

  # GET /legal_forms/new
  def new
    @legal_form = LegalForm.new
  end

  # GET /legal_forms/1/edit
  def edit
  end

  # POST /legal_forms or /legal_forms.json
  def create
    @legal_form = LegalForm.new(legal_form_params)

    respond_to do |format|
      if @legal_form.save
        format.html { redirect_to legal_form_url(@legal_form), notice: "Legal form was successfully created." }
        format.json { render :show, status: :created, location: @legal_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @legal_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legal_forms/1 or /legal_forms/1.json
  def update
    respond_to do |format|
      if @legal_form.update(legal_form_params)
        format.html { redirect_to legal_form_url(@legal_form), notice: "Legal form was successfully updated." }
        format.json { render :show, status: :ok, location: @legal_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @legal_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legal_forms/1 or /legal_forms/1.json
  def destroy
    @legal_form.destroy!

    respond_to do |format|
      format.html { redirect_to legal_forms_url, notice: "Legal form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal_form
      @legal_form = LegalForm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def legal_form_params
      params.require(:legal_form).permit(:name)
    end
end
