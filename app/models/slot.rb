class Slot < ActiveRecord::Base
  belongs_to :jumper
  belongs_to :load
end
