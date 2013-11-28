class CreateJumpersRatingsTable < ActiveRecord::Migration
  def change
    create_table :jumpers_ratings, id: false do |t|
      t.references  :jumper
      t.references  :rating
    end
  end
end
