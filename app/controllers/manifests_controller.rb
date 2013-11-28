class ManifestsController < ApplicationController
  def index
    @loads = Load.active_loads
    # Gives us a blank sheet to work with.
    #
    #
  end

end
