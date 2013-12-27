class Jumper < ActiveRecord::Base
  validates :email, :name, :license, :clubs, :phone, :nextofkin_name, :nextofkin_address, :nextofkin_phone, :nextofkin_relation, presence: true
  has_and_belongs_to_many :clubs
  has_and_belongs_to_many :ratings
  has_many :slots

  def outstanding_payments
    self.slots.where.not(:paid)
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
		# Placeholder
		return 1
	end

	def number_of_hl_days
		# Placeholder
		return 1
	end

	def number_of_hfl_days
		# Placeholder
		return 1
	end

 
  class << self
		# Available licenses
    def licenses
      return ["E","A","B","C","D"]
    end
		def kin_relation
			return ["Father","Mother","Sibling","Spouse","Friend"]
		end
 
#    def frequent_flyer
#      self.
#
#
#
#    end
  end

end
