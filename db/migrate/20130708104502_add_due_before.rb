class AddDueBefore < ActiveRecord::Migration
  def up
    add_column :work_orders, :due_before, :time
  end

  def down
  end
end
