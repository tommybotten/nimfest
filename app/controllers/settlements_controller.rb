class SettlementsController < ApplicationController
  def index
    @outstanding_payments = Slot.not_paid
    @total_outstanding = Slot.total_not_paid
    @loads = Load.all
    @ff_top_ten = Slot.find(:all, :select => 'count(*) count, jumper_id', :group => 'jumper_id', :order => 'count DESC', :limit => 10)
		@frequent_flyer = Jumper.frequent_flyer
		@jumpers = Jumper.all
    @load_dates = Load.dates
		@loads_this_year = Load.by_year(Time.now.year)
		@average_skydives_load = Slot.total_this_year/@loads_this_year.size.to_f
		@flight_hours_this_year = @loads_this_year.sum(:flighttime)
		@total_flighttime_cost = @flight_hours_this_year/60.to_f * Aircraft.first.price
		@slots_total_paid_this_year = Slot.by_year(2014).sum(:price)
		@average_slot_height = Slot.by_year(2014).sum(:height) / Slot.by_year(2014).size
  end

  def show
    # @date needs to be converted. Clumsy deserialization.
		@date = Time.parse(params[:id]).in_time_zone(Time.zone)
    @loads = Load.where(:departure_timestamp => @date.beginning_of_day..@date.end_of_day)
    @jumper_payment_hash = Slot.outstanding_by_day(params[:id])

     @chart4 = LazyHighCharts::HighChart.new('column') do |f|
        f.series(:name=>'Height',:data=> [600, 1000, 350, 600, 600])
        f.series(:name=>'Result',:data=>[-195, 25, -285, -105, 25 ] )
        f.title({ :text=>"Average height and monetary results"})
        f.options[:chart][:defaultSeriesType] = "column"
        f.plot_options({:column=>{:stacking=>"true"}})
    end
  end


	def pay_all
		jumper = Jumper.find(params[:id])
		jumper.pay_all
		redirect_to(:back)
	end


  def quarterlyreports
    @startmonth = 1
 		@slots = Slot.report(2014)
		@yearlyslots = Slot.by_year(2014).size
  end

  def showqreport

  end


end
