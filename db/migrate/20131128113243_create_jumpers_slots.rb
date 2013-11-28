class CreateJumpersSlots < ActiveRecord::Migration
  def change
    create_table :jumpers_slots, id: false do |t|
      t.references :jumper
      t.references :slot
    end
  end
end
