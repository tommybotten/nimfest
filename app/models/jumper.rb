class Jumper < ActiveRecord::Base
  validates :name, :license, :clubs, presence: true
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

 
  class << self
		# Available licenses
    def licenses
      return ["E","A","B","C","D"]
    end
  end

end
