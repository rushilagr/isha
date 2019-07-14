class CallTask::ConsumeController < ApplicationController
  before_action :set_call_task_caller, except: [:index, :send_sms]

  def index
    @ctcs = CallTaskCaller
      .includes(call_task_participants: [:participant], call_task: [:creator])
      .where(caller_id: current_user.id)

      redirect_to consume_call_task_path(@ctcs.first.id) if @ctcs.count == 1
  end

  def show
    ## If First attempt at calling?
    if @ctc.ctps.empty?
      session[:consume_call_type] = 'new_call'
      @ctp = @ctc.assign_new_participant
      render and return
    end

    ## Set session if empty, might reset over time.
    if session[:consume_call_type].nil?
      session[:consume_call_type] = @ctc.call_back_participants ? 'pending_call' : 'new_call'
    end

    session[:consume_call_type] = process_and_get_call_type session[:consume_call_type]
  end

  def set_call_type
    session[:consume_call_type] = params.fetch :consume_call_type
    redirect_to consume_call_task_path(@ctc.id)
  end

  def next_new_call
    @ctp = @ctc.current_participant || @ctc.assign_new_participant
    redirect_to consume_call_task_path(@ctc.id)
  end

  def feedback
    redirect_to consume_call_task_path(@ctc.id) if request.get?

    @ctp = CallTaskParticipant.find params[:ctp_id]

    if @ctp.update ctp_params
      redirect_to consume_call_task_path(id: @ctc.id, target_reached: @ctc.target_reached? ? true : nil), notice: 'Feedback taken. Process next call please.'

    else
      @errors = true
      render :show
    end
  end

  def send_sms
    # phone = Participant.find(params[:participant_id]).phone
    # SMS.send_sms_to_call_task_participant phone
    head :ok, content_type: "text/html"
  end

  private


  def set_call_task_caller
    @ctc = CallTaskCaller
      .includes(call_task_participants: [:participant], call_task: [:creator])
      .find(params[:id])
  end

  def ctp_params
    params.require(:call_task_participant).permit(:caller_comment, :status)
  end

  def process_and_get_call_type call_type
    map = {
      'pending_call' => {
        condition: @ctc.call_back_participants.present?,
        block: -> {
          ctps = @ctc.call_back_participants
          @ctp = params[:previous_ctp_id].nil? ? ctps.first : ctps.to_a.find_element_after(ctps.find params[:previous_ctp_id])
        }
      },

      'new_call' => {
        condition: @ctc.current_or_new_call_present?,
        block: -> { @ctp = @ctc.current_participant }
      }
    }

    loop do
      item = map.delete(call_type)
      item[:condition] ? (item[:block].call; break) : call_type = map.keys.first

      break if map.keys.empty?
    end

    call_type
  end
end
