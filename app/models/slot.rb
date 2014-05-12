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
    "Utfyllingshopp, elev"]

	scope :height_stats, -> { Slot.all.group_by(&:height).map {|k,v| [k, v.length]}.sort }

  before_validation :set_default_price
  before_create :verify_duplicate_jumper
  # Breaks _any_ update:
#  before_update :verify_duplicate_jumper
  validates :load_id,:price,:jumper_id,  presence: true
  validates :height, :inclusion => 1500..15000
  validates :jumptype, :inclusion => {in: JUMPTYPES }
	before_save :check_jumpmaster


  belongs_to :jumper
  belongs_to :load


	def missing_approval
		if self.jumper.license == "E" and self.approved.nil?
			return true
		else
			return false
		end
	end


  class << self
    def by_day(date)
        dt = date.to_time
        bod = dt.beginning_of_day
        eod = dt.end_of_day
        where("created_at >= ? and created_at <= ?", bod, eod)
    end


    def by_month(month)
        dt = DateTime.new(Time.now.year,month)
        bom = dt.beginning_of_month
        eom = dt.end_of_month
        where("created_at >= ? and created_at <= ?", bom, eom)
    end

    def by_year(year)
        dt = DateTime.new(year)
        boy = dt.beginning_of_year
        eoy = dt.end_of_year
        where("created_at >= ? and created_at <= ?", boy, eoy)
    end

    def outstanding_by_day(date)
      # Returns the amount of outstanding for each jumper by day.
       outstanding_hash = self.by_day(date.to_s).group(:jumper_id).sum(:price)
       jumper_hash = Hash.new
       outstanding_hash.each {|jumper_id, sum| jumper_hash.merge!({ Jumper.find(jumper_id).name => sum }) }
       return jumper_hash
    end

    def total_this_year
      self.by_year(Time.now.year).size
    end


		def report(year)
      return self.by_year(year).all.group_by { |s| [s.jumptype, s.approved, s.load.departure_timestamp.beginning_of_month..s.load.departure_timestamp.end_of_month]}.map {|k,v| [k[0],k[1], k.last.begin.month, v.length]}
		end

    def report_month(month)
      self.by_month(month).group_by { |s| [s.jumptype, s.approved, s.load.departure_timestamp.beginning_of_month..s.load.departure_timestamp.end_of_month]}.map {|k,v| [k[0],k[1], v.length]}
    end

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
		
		def check_jumpmaster
			# Placeholder. Verify that the skydiver can indeed be a jumpmaster, and that
			# there are not multiple.
			return 1
		end
end
