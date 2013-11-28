class CreatePricesSlots < ActiveRecord::Migration
  def change
    create_table :prices_slots, id: false do |t|
      t.references :price
      t.references :slot
    end
  end
end
