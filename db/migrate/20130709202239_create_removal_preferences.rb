class CreateRemovalPreferences < ActiveRecord::Migration
  def change
    create_table :removal_preferences do |t|
      t.integer :work_order_id 
      t.string :name 
      t.string :preference 

      t.timestamps
    end
  end
end
