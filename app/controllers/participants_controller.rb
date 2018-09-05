class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show]

  # GET /participants
  # GET /participants.json
  def index
    current_page = params[:page] || 1
    @participants = Participant.page(current_page).per(10)
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end
end
