class Blah < ActiveRecord::Migration
  def up
    remove_column :work_orders, :due_date
    add_column :work_orders, :due_date, :text, :default => "1970-01-01 00:00:00 -0600"
  end

  def down
  end
end
