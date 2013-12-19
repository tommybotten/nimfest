class Slot < ActiveRecord::Base
  belongs_to :jumper
  belongs_to :load




  class << self
		# Available jump types
    def jumptypes
      return ["Treningshopp","Demo","FS-Utsjekk"]
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
