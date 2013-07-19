class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :customer_id
      t.string :address
      t.integer :driveway_type
      t.integer :driveway_length
      t.integer :sidewalk_length
      t.string :profile_photo

      t.timestamps
    end
  end
end
