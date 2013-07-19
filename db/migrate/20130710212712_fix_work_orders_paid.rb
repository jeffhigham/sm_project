class FixWorkOrdersPaid < ActiveRecord::Migration
  def up
    remove_column :work_orders, :paid
    add_column :work_orders, :paid, :text, :default => nil
  end

  def down
  end
end
