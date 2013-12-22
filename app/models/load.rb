class Load < ActiveRecord::Base
  validates :pilot, :aircraft, presence: true
  belongs_to :jumper
  has_many :slots
  belongs_to :aircraft

	before_save :loadnumber


	def loadnumber
		# Logic: List the number of loads for the current date. If there are none,
		# first load, if there are some, +1 from the last load.
		unless self.loadfortheday
			unless Time.zone.now.beginning_of_day.eql?(Load.last.created_at.beginning_of_day)
				self.loadfortheday = 1 
			else
				self.loadfortheday = Load.last.loadfortheday + 1
			end
		end
		# time.between?(Load.last.created_at.beginning_of_day, Load.last.created_at.beginning_of_day + 1.day)
		# loadnumber = Load.last.id + 1
		# self.loadfortheday = loadnumber
	end

  def paid
    paid = 0
    self.slots.each do |slot|
      paid = paid + slot.price
    end
    return paid
  end

  def cost
    self.aircraft.price / 60 * self.flighttime
  end

  class << self
    # FIXME: Placeholder for viewing the loads that are currently active.
    # This means: Todays loads that does not have the status "landed"
    def active_loads
      Load.all
    end

		def states
			return ["Manifesting","In the air","Landed"]
		end

  end

end
