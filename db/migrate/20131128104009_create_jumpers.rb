class CreateJumpers < ActiveRecord::Migration
  def change
    create_table :jumpers do |t|
      t.string :name
      t.integer :license
      t.text :description
      t.integer :phone
      t.string :email
      t.boolean :verified
      t.text :nextofkin
      t.string :license

      t.timestamps
    end
  end
end
