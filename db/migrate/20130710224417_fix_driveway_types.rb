class FixDrivewayTypes < ActiveRecord::Migration
  def up
    remove_column :properties, :driveway_type
    remove_column :properties, :sidewalk_length
    remove_column :properties, :driveway_length

    add_column :properties, :driveway_type_id, :integer
    add_column :properties, :driveway_length_id, :integer
    add_column :properties, :sidewalk_length_id, :integer

  end

  def down
  end
end
