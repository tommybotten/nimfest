class AddOperativeFieldsToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :hfl, :string
		add_column :loads, :state, :string
  end
end
