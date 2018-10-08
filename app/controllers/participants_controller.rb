class ParticipantsController < ApplicationController
  before_action :set_participant, except: [:index]

  # GET /participants
  # GET /participants.json
  def index
    @search = get_participant_search_obj

    @participants = @search.result.not_dnd
    .page(params[:page] || 1) .per(10)
    .includes(pin_code: [:center])
  end

  def edit
  end

  def show
    redirect_to edit_participant_path(@participant)
  end

  def update
    if @participant.update(participant_params)
      redirect_to participants_path, notice: 'Meditator was successfully updated.'
    else
      render :edit
    end
  end

  def dnd
    if request.post?
      if @participant.mark_dnd(participant_params.merge dnd_marker_id: current_user.id)
        redirect_to participants_path, notice: 'Meditator was successfully marked DND.'
      else
        render :dnd
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit("name", "phone", "email", "gender", "occupation", "company", "dob", 'pin_code_id', 'dnd_reason')
    end
end
