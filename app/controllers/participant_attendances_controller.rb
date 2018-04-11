class ParticipantAttendancesController < ApplicationController
  before_action :set_participant_attendance, only: [:show, :edit, :update, :destroy]

  # GET /participant_attendances
  # GET /participant_attendances.json
  def index
    @participant_attendances = ParticipantAttendance.all
  end

  # GET /participant_attendances/1
  # GET /participant_attendances/1.json
  def show
  end

  # GET /participant_attendances/new
  def new
    @participant_attendance = ParticipantAttendance.new
  end

  # GET /participant_attendances/1/edit
  def edit
  end

  # POST /participant_attendances
  # POST /participant_attendances.json
  def create
    @participant_attendance = ParticipantAttendance.new(participant_attendance_params)

    respond_to do |format|
      if @participant_attendance.save
        format.html { redirect_to @participant_attendance, notice: 'Participant attendance was successfully created.' }
        format.json { render :show, status: :created, location: @participant_attendance }
      else
        format.html { render :new }
        format.json { render json: @participant_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participant_attendances/1
  # PATCH/PUT /participant_attendances/1.json
  def update
    respond_to do |format|
      if @participant_attendance.update(participant_attendance_params)
        format.html { redirect_to @participant_attendance, notice: 'Participant attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant_attendance }
      else
        format.html { render :edit }
        format.json { render json: @participant_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participant_attendances/1
  # DELETE /participant_attendances/1.json
  def destroy
    @participant_attendance.destroy
    respond_to do |format|
      format.html { redirect_to participant_attendances_url, notice: 'Participant attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant_attendance
      @participant_attendance = ParticipantAttendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_attendance_params
      params.require(:participant_attendance).permit(:program_participant_id, :batch)
    end
end
