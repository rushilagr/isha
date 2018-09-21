class CallTasksController < ApplicationController
  before_action :set_call_task, only: [:show, :edit, :update, :destroy]

  # GET /call_tasks
  # GET /call_tasks.json
  def index
    @call_tasks = CallTask.all.includes :creator, call_task_callers: [:caller], call_task_participants: [:participant]
  end

  # GET /call_tasks/1
  # GET /call_tasks/1.json
  def show
  end

  # GET /call_tasks/new
  def new
    @call_task = CallTask.new
  end

  # GET /call_tasks/1/edit
  def edit
  end

  # POST /call_tasks
  # POST /call_tasks.json
  def create
    @call_task = CallTask.new(call_task_params)

    respond_to do |format|
      if @call_task.save
        format.html { redirect_to @call_task, notice: 'Call task was successfully created.' }
        format.json { render :show, status: :created, location: @call_task }
      else
        format.html { render :new }
        format.json { render json: @call_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /call_tasks/1
  # PATCH/PUT /call_tasks/1.json
  def update
    respond_to do |format|
      if @call_task.update(call_task_params)
        format.html { redirect_to @call_task, notice: 'Call task was successfully updated.' }
        format.json { render :show, status: :ok, location: @call_task }
      else
        format.html { render :edit }
        format.json { render json: @call_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /call_tasks/1
  # DELETE /call_tasks/1.json
  def destroy
    @call_task.destroy
    respond_to do |format|
      format.html { redirect_to call_tasks_url, notice: 'Call task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call_task
      @call_task = CallTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_task_params
      params.fetch(:call_task, {})
    end
end
