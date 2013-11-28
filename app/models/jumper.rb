class Jumper < ActiveRecord::Base
  validates :name, :license, :clubs, presence: true
  has_and_belongs_to_many :clubs
  has_and_belongs_to_many :ratings
  has_many :slots
end
