class CreateJumpersClubsTable < ActiveRecord::Migration
  def change
    create_table :clubs_jumpers, id: false do |t|
      t.references :club
      t.references :jumper
    end
  end
end
