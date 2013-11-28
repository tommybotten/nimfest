class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.string :pilot
      t.integer :flighttime

      t.timestamps
    end
  end
end
