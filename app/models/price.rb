class Price < ActiveRecord::Base
  has_and_belongs_to_many :aircrafts
  has_many :slots
end
