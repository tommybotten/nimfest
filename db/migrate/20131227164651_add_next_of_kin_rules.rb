class AddNextOfKinRules < ActiveRecord::Migration
  def change
		add_column :jumpers, :nextofkin_name, :string
		add_column :jumpers, :nextofkin_relation, :string
		add_column :jumpers, :nextofkin_address, :string
		add_column :jumpers, :nextofkin_phone, :integer
		remove_column :jumpers, :nextofkin
  end
end
