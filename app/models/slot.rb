class Slot < ActiveRecord::Base
  belongs_to :jumper
  belongs_to :load




  class << self
		# Available jump types
    def jumptypes
      return ["Treningshopp",
						"Demo",
						"FS-Utsjekk",
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
						"Wingsuit",
						"Hop and pop",
						"Fjellflyving"
						]
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
end
