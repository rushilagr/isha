class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:create_temp]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    set_program
    redirect_to program_confirmable_path if @program.nil?
    
    @participant = Participant.new
    @participant.program_participants.build
  end

  # GET /participants/1/edit
  def edit
    @program = @participant.programs.first
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)
    set_program

    respond_to do |format|
      if @participant.save
        format.html {
          redirect_to new_participant_path(program_id: params[:program_id]),
          notice: 'Participant successfully created.',
          flash: {success: 'YESSSS'}
        }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_program
      @program = Program.find(params[:program_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:name, :phone, :email, :pincode, :gender, :occupation, :city_id, :temp_participant_id, program_participants_attributes: [:program_id, :status])
    end
end
