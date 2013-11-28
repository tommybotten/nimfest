class AlterAircraftTypeName < ActiveRecord::Migration
  def change
    rename_column :aircrafts, :type, :aircraft_type
  end
end
