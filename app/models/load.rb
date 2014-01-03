class Load < ActiveRecord::Base
	before_save :default_values
  validates :pilot, :aircraft, :location, :state,  presence: true
  belongs_to :jumper
	belongs_to :hl, polymorphic: true
  has_many :slots, :dependent => :destroy
  belongs_to :aircraft
	scope :active, -> { where(state != "Landed") }
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
    self.aircraft.price / 60 * self.flighttime if self.flighttime?
  end

  class << self
		def states
			return ["Manifesting","In the air","Landed"]
		end
  end
	
  def default_values
    self.hl_type ||= "Jumper"
  end

  def free
    avail_jumpers ||= []
    used_jumpers ||= []
    slots = self.slots.all
    slots.each do |slot|
      used_jumpers << slot.jumper
    end
    return Jumper.all - used_jumpers
  end

end
