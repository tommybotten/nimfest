class AddHlIdToLoad < ActiveRecord::Migration
  def change
    add_column :loads, :hl_id, :integer
    add_column :loads, :hl_type, :string, :default => 'Jumper'
  end
end
