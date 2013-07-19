class CreateDrivewayTypes < ActiveRecord::Migration
  def change
    create_table :driveway_types do |t|
      t.string :property_id
      t.string :integer
      t.string :name
      t.integer :width

      t.timestamps
    end
  end
end
