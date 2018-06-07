class ProgramsController < ApplicationController
  # GET /programs
  # GET /programs.json
  def confirmable
    @programs = Program.confirmable.order(:starts_at)
    @header = 'Confirm Program Registrations'
    render :index
  end

  def attendanceable
    @programs = Program.attendanceable.order(:starts_at)
    @header = 'Mark Program Attendance'
    render :index
  end

  def attendance
    set_program
  end

  def attendance_toggle
    set_program
    Participant.find(params[:participant_id]).set_dropped_out(params[:id], params[:dropped_out_status])
    render :attendance
  end

  def index
    @header = 'All Programs'
    @programs = Program.index
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    set_program
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit
    set_program
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program created. You can create participants now or later.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    set_program
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
    set_program
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
      params.require(:program).permit :starts_at, :ends_at, :type, :center_id, :user_id
    end
end
