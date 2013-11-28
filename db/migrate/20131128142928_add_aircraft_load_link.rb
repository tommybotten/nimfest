class AddAircraftLoadLink < ActiveRecord::Migration
  def change
    add_column :loads, :aircraft_id, :integer
  end
end
