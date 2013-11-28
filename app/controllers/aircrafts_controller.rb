class AircraftsController < ApplicationController
  before_action :set_aircraft, only: [:show, :edit, :update, :destroy]

  # GET /aircrafts
  # GET /aircrafts.json
  def index
    @aircrafts = Aircraft.all
  end

  # GET /aircrafts/1
  # GET /aircrafts/1.json
  def show
  end

  # GET /aircrafts/new
  def new
    @aircraft = Aircraft.new
  end

  # GET /aircrafts/1/edit
  def edit
  end

  # POST /aircrafts
  # POST /aircrafts.json
  def create
    @aircraft = Aircraft.new(aircraft_params)

    respond_to do |format|
      if @aircraft.save
        format.html { redirect_to @aircraft, notice: 'Aircraft was successfully created.' }
        format.json { render action: 'show', status: :created, location: @aircraft }
      else
        format.html { render action: 'new' }
        format.json { render json: @aircraft.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aircrafts/1
  # PATCH/PUT /aircrafts/1.json
  def update
    respond_to do |format|
      if @aircraft.update(aircraft_params)
        format.html { redirect_to @aircraft, notice: 'Aircraft was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aircraft.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aircrafts/1
  # DELETE /aircrafts/1.json
  def destroy
    @aircraft.destroy
    respond_to do |format|
      format.html { redirect_to aircrafts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aircraft
      @aircraft = Aircraft.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aircraft_params
      params.require(:aircraft).permit(:type, :name, :price, :capacity)
    end
end
