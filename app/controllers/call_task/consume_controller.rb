class CallTask::ConsumeController < ApplicationController
  before_action :set_call_task_caller, except: [:index]

  def index
    @ctcs = CallTaskCaller
      .includes(call_task: [:creator, call_task_participants: [:participant]])
      .where(caller_id: current_user.id)
  end

  def show
    ## If First attempt at calling?
    if @ctc.participants.empty?
      next_new_call
      session[:consume_call_type] = 'new_call'
      render and return
    end

    ## Set session if empty, might reset over time.
    if session[:consume_call_type].nil?
      session[:consume_call_type] = @ctc.pending_participants ? 'pending_call' : 'new_call'
    end

    ## If session == pending call
    if session[:consume_call_type] == 'pending_call'
      @ctp = get_next_pending_call
      session[:consume_call_type] = 'new_call' if @ctp.nil? ## If pending calls exhausted, shift to new call tab
    end

    ## If session == new call
    if session[:consume_call_type] == 'new_call'
      @ctp = get_currently_show_call if get_currently_show_call.present?
      @target_reached = true if @ctc.completed_participants.count == @ctc.call_task_max_calls_per_caller
    end
  end

  def set_call_type
    session[:consume_call_type] = params.fetch :consume_call_type
    redirect_to consume_call_task_path(@ctc.id)
  end

  def next_new_call
    @ctp = get_currently_show_call || @ctc.assign_new_participant
    render :show
  end

  def feedback
    @ctp = CallTaskParticipant.find params[:ctp_id]

    if @ctp.update ctp_params
      redirect_to consume_call_task_path(@ctc.id), notice: 'Feedback taken. Process next call please.'

    else
      @errors = true
      render :show
    end
  end

  private

  def get_next_pending_call
    ctps = @ctc.call_back_participants

    if params[:previous_ctp_id].nil?
      ctp = ctps.first
    else
      prev_ctp = ctps.find(params[:previous_ctp_id])
      ctp = ctps.to_a.find_element_after prev_ctp
    end
  end

  def get_currently_show_call
    @ctc.current_participant
  end

  def set_call_task_caller
    @ctc = CallTaskCaller
      .includes(call_task: [:creator, call_task_participants: [:participant]])
      .find(params[:id])
  end

  def ctp_params
    params.require(:call_task_participant).permit(:caller_comment, :status)
  end
end
