class CallTasksController < ApplicationController
  before_action :set_call_task, except: [:index, :new, :create]


  ##-------------------------------------------------------------
  ## Scaffold
  ##-------------------------------------------------------------


  def index
      # .joins(:creator).where(creator: {center_id: current_user.center_id} )
    if current_user.admin?
      @call_tasks = CallTask
        .includes(call_task_callers: [:caller], call_task_participants: [:participant])
        .all
    else  
      @call_tasks = CallTask
        .includes(call_task_callers: [:caller], call_task_participants: [:participant])
        .select { |ct| ct.creator.center_id == current_user.center_id }
    end   

    redirect_to(new_call_task_path) unless @call_tasks.present?
  end

  def show
    session.delete :persistent_flash
    flash.delete :persistent

    unless redirect_to_call_task_step_if_pending
      flash[:notice] = 'Calling task created. Your volunteers have received SMSs to start calling.'
    end

    @ctcs = params[:caller_scope].present? ? @call_task.ctcs.send(params[:caller_scope]) : @call_task.ctcs
    @ctps = params[:participant_scope].present? ? @call_task.ctps.send(params[:participant_scope]) : @call_task.ctps
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
    @unassigned_callers = begin
      cs = current_user.admin? ? User.all : User.where(center_id: current_user.center_id)
      cs - @assigned_callers - [current_user]
    end

    flash.now[:notice] = 'Here you can add volunteers to make calls. Either add them from the list below, or create new volunteers.' unless flash.now[:notice]
  end

  def caller_toggle
    if request.put?
      CallTaskCaller.create! caller_id: params[:c_id], call_task_id: params[:id]
      flash[:notice] = "Volunteer added. Click the greeh button when done."

    elsif request.delete?
      CallTaskCaller.find_by(caller_id: params[:c_id]).destroy
      flash[:notice] = "Volunteer deleted. Click the greeh button when done."
    end

    ## To assign callers instance vars
    callers
    # redirect_to call_task_callers_path(id: @call_task.id)
  end

  def new_users
    session[:persistent_flash] = {
      message: 'Click here after creating all volunteers',
      link: call_task_path(@call_task.id)
    }
    redirect_to new_user_path
  end

  def callers_confirm
    @call_task.update! callers_confirmed: true
    redirect_to call_task_path(@call_task)
  end


  ##-------------------------------------------------------------
  ## Participants Mgmnt
  ##-------------------------------------------------------------


  def participants
    if request.put? || request.get?
      
      @search = get_participant_search_obj
      @assigned_participants = @call_task.participants

      @participants = begin
        ps = @search.result.valid_phone.not_dnd
        ps = ps.joins(:pin_code).where(pin_codes: {center_id: current_user.center_id}) unless current_user.admin?
        ps - @assigned_participants
      end

      ## If add to list list button clicked
      if params.keys.include?('submit-post')
        @participants.each do |parti|
          CallTaskParticipant.create participant_id: parti.id, call_task_id: @call_task.id, status: 'unassigned'
        end

        # Redirect to reset the params & search query
        redirect_to(call_task_participants_path(added_count: @participants.count) ,anchor: 'search') and return
      end
    end

    if request.post?
      @call_task.update! participants_confirmed: true
      redirect_to call_task_path(@call_task)
    end
  end

  def participants_destroy
    @call_task.call_task_participants.unassigned.destroy_all
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
  ## Confirm
  ##-------------------------------------------------------------

  def review
    flash.now[:notice] = 'Review the details and press confirm.'
  end

  def review_confirm
    unless @call_task.confirmed
      @call_task.update! confirmed: true
      @call_task.send_confirmed_sms_to_callers
    end

    redirect_to call_task_path(@call_task)
  end

  ##-------------------------------------------------------------
  ## Private
  ##-------------------------------------------------------------


  private
    def redirect_to_call_task_step_if_pending
      sequence = [
        {action: :participants, conditions: ['participants_confirmed', ['participants', 'present?']]},
        {action: :callers, conditions: ['callers_confirmed', ['callers', 'present?']]},
        {action: :limit, conditions: ['max_calls_per_caller']},
        {action: :review, conditions: ['confirmed']},
      ]

      sequence.each do |map|
        map[:conditions].each do |condition|
          @call_task.send_chain(condition) ? next : (redirect_to(action: map[:action]) and return true)
        end
      end

      return false
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_call_task
      @call_task = CallTask
        .includes(:creator, call_task_callers: [:caller], call_task_participants: [:participant])
        .find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_task_params
      params.require(:call_task).permit(:name, :creator_id, :max_calls_per_caller, :script, :have_sms_script, :sms_script)
    end

    def click_here_link_to_ct path
      view_context.link_to 'Click here', send(path, id: params[:id])
    end
end
