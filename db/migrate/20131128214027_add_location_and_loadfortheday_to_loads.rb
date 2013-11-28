class AddLocationAndLoadforthedayToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :location, :string
    add_column :loads, :loadfortheday, :integer
  end
end
