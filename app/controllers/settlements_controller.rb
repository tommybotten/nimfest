class SettlementsController < ApplicationController

  def index
    @outstanding_payments = Slot.not_paid
    @total_outstanding = Slot.total_not_paid
    @loads = Load.all
    @slots = Slot.find(:all, :select => 'count(*) count, jumper_id', :group => 'jumper_id', :order => 'count DESC', :limit => 5)
		@jumpers = Jumper.all
    @load_dates = Load.dates
  end

  def show
    # Shows statistics for a given day
    @loads = Load.all
    #
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
