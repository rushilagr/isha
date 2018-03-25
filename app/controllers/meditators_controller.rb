class MeditatorsController < ApplicationController
  before_action :set_meditator, only: [:show, :edit, :update, :destroy]

  # GET /meditators
  # GET /meditators.json
  def index
    @meditators = Meditator.all
  end

  # GET /meditators/1
  # GET /meditators/1.json
  def show
  end

  # GET /meditators/new
  def new
    @meditator = Meditator.new
  end

  # GET /meditators/1/edit
  def edit
  end

  # POST /meditators
  # POST /meditators.json
  def create
    @meditator = Meditator.new(meditator_params)

    respond_to do |format|
      if @meditator.save
        format.html { redirect_to @meditator, notice: 'Meditator was successfully created.' }
        format.json { render :show, status: :created, location: @meditator }
      else
        format.html { render :new }
        format.json { render json: @meditator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meditators/1
  # PATCH/PUT /meditators/1.json
  def update
    respond_to do |format|
      if @meditator.update(meditator_params)
        format.html { redirect_to @meditator, notice: 'Meditator was successfully updated.' }
        format.json { render :show, status: :ok, location: @meditator }
      else
        format.html { render :edit }
        format.json { render json: @meditator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meditators/1
  # DELETE /meditators/1.json
  def destroy
    @meditator.destroy
    respond_to do |format|
      format.html { redirect_to meditators_url, notice: 'Meditator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meditator
      @meditator = Meditator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meditator_params
      params.fetch(:meditator, {})
    end
end
