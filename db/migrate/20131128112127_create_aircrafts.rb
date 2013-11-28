class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :type
      t.string :name
      t.integer :price
      t.integer :capacity

      t.timestamps
    end
  end
end
