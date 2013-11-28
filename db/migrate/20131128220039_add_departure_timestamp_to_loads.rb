class AddDepartureTimestampToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :departure_timestamp, :timestamp
  end
end
