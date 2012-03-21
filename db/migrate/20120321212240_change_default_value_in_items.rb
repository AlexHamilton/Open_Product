class ChangeDefaultValueInItems < ActiveRecord::Migration
  def change
    change_column :items, :licence_id, :integer, :null => false, :default => 1
    change_column :items, :whole_object, :boolean, :null => false, :default => true
  end
end
