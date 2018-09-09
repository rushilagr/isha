class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show]

  # GET /participants
  # GET /participants.json
  def index
    @search = Participant.ransack(params[:q])
    @participants = @search.result
      .page(params[:page] || 1) .per(10)

    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
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
