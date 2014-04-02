class Jumper < ActiveRecord::Base
  validates :name, :license, :clubs, :phone, :nextofkin_name, :nextofkin_address, :nextofkin_phone, :nextofkin_relation, presence: true

  validates :email, :format => { :with => /([^@\s]+)@((?:[-a-z0-9]+\.)*[a-z]{2,})/i },
  	:length => { :maximum => 40 },
		:allow_blank => false
	validates_uniqueness_of :name, :licensenumber, :phone, :email


  has_and_belongs_to_many :clubs
  has_and_belongs_to_many :ratings
	has_one :load , as: :hl
  has_many :slots

  def outstanding_payments
    self.slots.where(:paid => nil)
  end

  def outstanding_amount
    amount = 0
    self.outstanding_payments.each do |payment|
      amount = payment.price + amount
    end
    return amount
  end

	def number_of_jumpmaster_loads
		self.slots.where(:jumpmaster => true).count
	end

	def number_of_hl_loads
		Load.where(:hl_id => self.id).count
	end

	def number_of_hl_days
		# Placeholder
		return 1
	end

	def number_of_hfl_days
		# Placeholder
		return 1
	end

	def pay_all
		self.slots.each do |slot|
			slot.paid = true
			slot.save
		end
	end

 
  class << self
		# Available licenses
    def licenses
      return ["E","A","B","C","D"]
    end
		def kin_relation
			return ["Father","Mother","Sibling","Spouse","Friend"]
		end

		def hls
			# Simple HL list. No logic related to student or other types of HL service.
			hls = Jumper.where("license = \"D\" OR license = \"C\"")
		end

		def available
			# More logic might come in here. For instance paid previous loads days,
			# and so on.
			return Jumper.where(:verified => true).order(:name)
		end
 
#    def frequent_flyer
#      self.
#
#
#
#    end
  end

end
