class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
