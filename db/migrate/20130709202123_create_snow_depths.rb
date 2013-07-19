class CreateSnowDepths < ActiveRecord::Migration
  def change
    create_table :snow_depths do |t|
      t.integer :work_order_id 
      t.text   :name 
      t.integer :inches 

      t.timestamps
    end
  end
end
