class CallTasksController < ApplicationController
  before_action :set_call_task, only: [:show, :edit, :update, :destroy, :callers, :participants, :participants_destroy]


  ##-------------------------------------------------------------
  ## Scaffold
  ##-------------------------------------------------------------


  def index
    @call_tasks = CallTask
      .where(creator_id: current_user.id)
      .includes :creator, call_task_callers: [:caller], call_task_participants: [:participant]
  end

  def show
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
      notice = "Volunteer created."

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

    ## Dislay notice for results if searched
    if params[:q]
      flash.now[:notice] = "#{@participants.count} results found. Add results to calling list or search again."
    end

    ## If add to list list button clicked
    if params.keys.include?('submit-post')
      @participants.each do |parti|
        CallTaskParticipant.create participant_id: parti.id, call_task_id: @call_task.id
      end

      flash[:notice] = "#{@participants.count} results added to calling list. Add more or #{click_here_link_to_ct('call_task_callers_path')} if list is complete."

      # Redirect to reset the params & search query
      redirect_to(call_task_participants_path)
    end
  end

  def participants_destroy
    @call_task.call_task_participants.destroy_all
    flash.now[:alert] = 'Calling list deleted.'
    redirect_to call_task_participants_path
  end


  ##-------------------------------------------------------------
  ## Private
  ##-------------------------------------------------------------


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call_task
      @call_task = CallTask
        .includes(:creator, call_task_callers: [:caller], call_task_participants: [:participant])
        .find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_task_params
      params.require(:call_task).permit(:name, :creator_id)
    end

    def click_here_link_to_ct path
      view_context.link_to 'Click here', send(path, id: params[:id])
    end
end
