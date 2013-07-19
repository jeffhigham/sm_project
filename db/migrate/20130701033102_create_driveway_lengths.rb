class CreateDrivewayLengths < ActiveRecord::Migration
  def change
    create_table :driveway_lengths do |t|
      t.text :name
      t.integer :feet

      t.timestamps
    end
  end
end
