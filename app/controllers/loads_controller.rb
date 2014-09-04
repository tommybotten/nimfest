class LoadsController < ApplicationController
  before_action :set_load, only: [:show, :edit, :update, :destroy]

  # GET /loads
  # GET /loads.json
  def index
    @load_dates = Load.dates
    @loads = Load.active
  end

  # GET /loads/1
  # GET /loads/1.json
  def show
  end

  # GET /loads/new
  def new
    @load = Load.new
		@load.pilot ||= Load.last.pilot if Load.last.present? 
		@load.location ||= Load.last.location if Load.last.present? 
		@load.aircraft ||= Load.last.aircraft if Load.last.present? 
		@load.hl ||= Load.last.hl if Load.last.present?
		@load.hfl ||= Load.last.hfl if Load.last.present? 
		@slots = Slot.new
  end

  # GET /loads/1/edit
  def edit
    @slots = @load.slots
		@slot = Slot.new
		@aircraft = @load.aircraft
  end

  # POST /loads
  # POST /loads.json
  def create
    @load = Load.new(load_params)

    respond_to do |format|
      if @load.save
        format.html { redirect_to edit_load_path(@load), notice: 'Load was successfully created.' }
        format.json { render action: 'show', status: :created, location: @load }
      else
        format.html { render action: 'new' }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loads/1
  # PATCH/PUT /loads/1.json
  def update
    respond_to do |format|
      if @load.update(load_params)
        format.html { redirect_to loads_path, notice: 'Load was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loads/1
  # DELETE /loads/1.json
  def destroy
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = Load.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def load_params
      params.require(:load).permit(:pilot, :flighttime, :location, :departure_timestamp, :aircraft_id, :hfl, :state, :hl_id)
    end
end
