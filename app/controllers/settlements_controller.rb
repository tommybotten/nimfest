class SettlementsController < ApplicationController
  def index
    @outstanding_payments = Slot.not_paid
    @total_outstanding = Slot.total_not_paid
    @loads = Load.all
    @ff_top_ten = Slot.find(:all, :select => 'count(*) count, jumper_id', :group => 'jumper_id', :order => 'count DESC', :limit => 10)
		@jumpers = Jumper.all
    @load_dates = Load.dates
  end

  def show
    # @date needs to be converted. Clumsy deserialization.
    # Why is this off by one? ...
		@date = Time.parse(params[:id]).in_time_zone(Time.zone) + 1.day
    @loads = Load.where(:departure_timestamp => @date.beginning_of_day..@date.end_of_day)
  end

	def pay_all
		jumper = Jumper.find(params[:id])
		jumper.pay_all
		redirect_to(:back)
	end

end
