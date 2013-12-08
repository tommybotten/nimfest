class Slot < ActiveRecord::Base
  belongs_to :jumper
  belongs_to :load


  class << self
		# Available jump types
    def jumptypes
      return ["Treningshopp","Demo","FS-Utsjekk"]
    end
  end
end
