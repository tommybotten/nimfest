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
  end
end
