class ProfessorsController < ApplicationController
  before_action :set_professor, only: %i[ show edit update destroy ]

  # GET /professors or /professors.json
  def index
    @professors = Professor.all
  end

  # GET /professors/1 or /professors/1.json
  def getProfessor
    @professor = Professor.where(id:params[:id])
    if(@professor != [])
    render json: @professor, :status => :ok
    else
      error = {
        error: "Erro na recuperação do professor!"};
      render :json => error, :status => :bad_request
    end
  end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit
  end

  # POST /professors or /professors.json
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to professor_url(@professor), notice: "Professor was successfully created." }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professors/1 or /professors/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to professor_url(@professor), notice: "Professor was successfully updated." }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1 or /professors/1.json
  def destroy
    @professor.destroy

    respond_to do |format|
      format.html { redirect_to professors_url, notice: "Professor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def professor_params
      params.require(:professor).permit(:nome, :cpf)
    end
end
