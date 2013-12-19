class SettlementsController < ApplicationController

  def index
    @outstanding_payments = Slot.not_paid
    @total_outstanding = Slot.total_not_paid
    # Should be restricted to todays load
    @loads = Load.all
  end

end
