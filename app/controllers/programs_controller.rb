class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)
    @program.batches = program_params[:batches].reject { |b| b.empty? }

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url, notice: 'Program was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit :starts_at, :ends_at, :length, :status, :teachers, :center_id, :user_id, :batches, batches: []
    end
end
