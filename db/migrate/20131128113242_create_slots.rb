class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :height
      t.integer :price
      t.boolean :paid
      t.boolean :approved
      t.string :jumptype
      t.boolean :jumpmaster
      t.references :jumper
      t.references :load

      t.timestamps
    end
  end
end
