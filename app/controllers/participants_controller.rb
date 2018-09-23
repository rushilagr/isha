class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show]

  # GET /participants
  # GET /participants.json
  def index
    @search = build_ransack_search Participant

    @participants = @search.result
    .page(params[:page] || 1) .per(10)
    .includes(pin_code: [:center])
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
