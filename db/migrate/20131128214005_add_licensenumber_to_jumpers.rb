class AddLicensenumberToJumpers < ActiveRecord::Migration
  def change
    add_column :jumpers, :licensenumber, :integer
  end
end
