class MoreTweakingWorkOrders < ActiveRecord::Migration
  def up
    remove_column :work_orders, :heavy_snow
    remove_column :work_orders, :driveway_only
    remove_column :work_orders, :salt_on_walk

    add_column :work_orders, :snow_depth, :number, :default => 12 
    add_column :work_orders, :removal_preference, :text, :default => "Driveway + Sidewalks"
    add_column :work_orders, :deice_sidewalk, :text, :default => "Yes"
  end

  def down
  end
end
