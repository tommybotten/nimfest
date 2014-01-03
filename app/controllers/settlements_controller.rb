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
    # @date needs to be converted. Clumsy deserialization.
		@date = Time.parse(params[:id]).in_time_zone(Time.zone)
    @loads = Load.where(:departure_timestamp => @date.beginning_of_day..@date.end_of_day)
  end
end
