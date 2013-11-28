class CreateAircraftsPrices < ActiveRecord::Migration
  def change
    create_table :aircrafts_prices, id: false do |t|
      t.references :aircraft
      t.references :price
    end
  end
end
