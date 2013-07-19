class FixDateStuffInWorkOrders < ActiveRecord::Migration
  def up
    remove_column :work_orders, :due_date
    remove_column :work_orders, :due_before

    add_column :work_orders, :due_date, :time
  end

  def down
  end
end
