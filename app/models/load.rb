class Load < ActiveRecord::Base
  validates :pilot, :aircraft, presence: true
  belongs_to :jumper
  has_many :slots
  belongs_to :aircraft

  class << self
    # FIXME: Placeholder for viewing the loads that are currently active.
    # This means: Todays loads that does not have the status "landed"
    def active_loads
      Load.all
    end
  end

end
