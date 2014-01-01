class Slot < ActiveRecord::Base
  JUMPTYPES = ["Treningshopp",
    "Demo",
    "UL",
    "UL-M",
    "UL-T",
    "FF-5 sekunder",
    "FF-7 sekunder",
    "FF-10 sekunder",
    "FF-15 sekunder",
    "FF-20 sekunder",
    "FF-30 sekunder",
    "FS-Utsjekk",
    "FF-Utsjekk",
    "Utfyllingshopp, elev",
    "Wingsuit",
    "Hop and pop",
    "Fjellflyging"]

  before_validation :set_default_price
  before_create :verify_duplicate_jumper
  # Breaks _any_ update:
#  before_update :verify_duplicate_jumper
  validates :load_id,:price,:jumper_id,  presence: true
  validates :height, :inclusion => 1500..15000
  validates :jumptype, :inclusion => {in: JUMPTYPES }

  # Before save- if price is nil, update with default price.
  belongs_to :jumper
  belongs_to :load

  class << self
		# Available jump types
    def jumptypes
      return JUMPTYPES
    end
    def not_paid
      self.where.not(:paid)
    end

    def total_not_paid
      amount = 0
      self.where.not(:paid).each do |slot|
        amount = slot.price + amount
      end
      return amount
    end
  end
  
  private
    def set_default_price
      if self.price.nil?
        self.price = Price.find_by_height(self.height).price
      end
#      self.price = "270" if self.jumper.license == "E"
    end

    def verify_duplicate_jumper
      # A skydiver cannot be registered twice on a load. Is this the correct way to do this?
      # Also, this breaks for updates on an existing load... How to fix? More logic 
      # with slot id? ... seems crappy.
      if self.load.slots.where("jumper_id = ?", self.jumper_id).count >= 1
        errors.add(:base, 'A skydiver cannot appear twice on a single load')
        return false
      end
    end
end
