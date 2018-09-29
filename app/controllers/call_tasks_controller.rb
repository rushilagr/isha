class CallTasksController < ApplicationController
  before_action :set_call_task, only: [:show, :edit, :update, :destroy, :callers, :participants, :participants_destroy, :limit]


  ##-------------------------------------------------------------
  ## Scaffold
  ##-------------------------------------------------------------


  def index
    @call_tasks = CallTask
      .where(creator_id: current_user.id)
      .includes :creator, call_task_callers: [:caller], call_task_participants: [:participant]
  end

  def show
    redirect_to_call_task_step_if_pending
  end

  def new
    @call_task = CallTask.new
  end

  def edit
  end

  def create
    @call_task = CallTask.new(call_task_params.merge creator_id: current_user.id)

    if @call_task.save
      redirect_to call_task_participants_path(@call_task.id), notice: 'Here you can create the Calling List for this task. Make a search, and those meditators can be added to the list.'
    else
      render :new
    end
  end

  def update
    if @call_task.update(call_task_params)
      redirect_to @call_task, notice: 'Call task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @call_task.destroy
    redirect_to call_tasks_url, notice: 'Call task was successfully destroyed.'
  end


  ##-------------------------------------------------------------
  ## Callers Mgmnt
  ##-------------------------------------------------------------


  def callers
    @assigned_callers = @call_task.callers
    @unassigned_callers = User.where(center_id: current_user.center_id) - @assigned_callers
    flash.now[:notice] = 'Here you can add volunteers to make calls. Either add them from the list below, or create new volunteers.' unless flash.now[:notice]
  end

  def caller_toggle
    if request.put?
      CallTaskCaller.create! caller_id: params[:c_id], call_task_id: params[:id]
      notice = "Volunteer added."

    elsif request.delete?
      CallTaskCaller.find_by(caller_id: params[:c_id]).destroy
      notice = "Volunteer deleted."
    end

    redirect_to call_task_callers_path(params[:id]), notice: notice
  end


  ##-------------------------------------------------------------
  ## Participants Mgmnt
  ##-------------------------------------------------------------


  def participants
    @search = build_ransack_search Participant

    @assigned_participants = @call_task.participants

    @participants = @search .result .valid_phone - @assigned_participants

    ## If add to list list button clicked
    if params.keys.include?('submit-post')
      @participants.each do |parti|
        CallTaskParticipant.create participant_id: parti.id, call_task_id: @call_task.id
      end

      # Redirect to reset the params & search query
      redirect_to(call_task_participants_path(added_count: @participants.count) ,anchor: 'search') and return
    end
  end

  def participants_destroy
    @call_task.call_task_participants.destroy_all
    redirect_to call_task_participants_path(list_deleted: true, anchor: 'search')
  end


  ##-------------------------------------------------------------
  ## Call Limit
  ##-------------------------------------------------------------

  def limit
    if request.post?
      if @call_task.update(call_task_params)
        redirect_to call_task_path(@call_task), notice: 'Calling task created. Your volunteers will receive SMSs to start calling.'
      end
    else
      flash.now[:notice] = 'Set a limit for the number of calls each volunteer will make. Details are provided below to help you.'
    end
  end


  ##-------------------------------------------------------------
  ## Private
  ##-------------------------------------------------------------


  private
    def redirect_to_call_task_step_if_pending
      sequence = [
        {action: :participants, condition: 'participants'},
        {action: :callers, condition: 'callers'},
        {action: :limit, condition: 'max_calls_per_caller'},
      ]

      sequence.each do |map|
        @call_task.send(map[:condition]).present? ? next : (redirect_to(action: map[:action]) and return)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_call_task
      @call_task = CallTask
        .includes(:creator, call_task_callers: [:caller], call_task_participants: [:participant])
        .find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_task_params
      params.require(:call_task).permit(:name, :creator_id, :max_calls_per_caller)
    end

    def click_here_link_to_ct path
      view_context.link_to 'Click here', send(path, id: params[:id])
    end
end
