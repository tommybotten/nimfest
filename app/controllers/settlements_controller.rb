class SettlementsController < ApplicationController

  def index
    @outstanding_payments = Slot.not_paid
    @total_outstanding = Slot.total_not_paid
    # Should be restricted to todays load
    @loads = Load.all
    @slots = Slot.find(:all, :select => 'count(*) count, jumper_id', :group => 'jumper_id', :order => 'count DESC', :limit => 10)
		@jumpers = Jumper.all
  end

end
