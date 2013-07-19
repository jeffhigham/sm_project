class FixWorkOrders < ActiveRecord::Migration
  def up
    remove_column :work_orders, :invliced
    remove_column :work_orders, :discount 
    add_column :work_orders, :invoiced, :boolean, :default => false 
    add_column :work_orders, :price, :decimal, :precision => 5, :scale => 2, :default => 0.00 
    add_column :work_orders, :discount, :integer, :default => 0 
  end

  def down
  end
end
