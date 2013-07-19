class FixRemovalPreference < ActiveRecord::Migration
  def up
    remove_column :work_orders, :removal_preference
    remove_column :work_orders, :snow_depth
    remove_column :work_orders, :invoiced
    add_column :work_orders, :removal_preference_id, :integer
    add_column :work_orders, :snow_depth_id, :integer
    add_column :work_orders, :saved, :text

    remove_column :snow_depths, :work_order_id
    remove_column :removal_preferences, :work_order_id
  end

  def down
  end
end
