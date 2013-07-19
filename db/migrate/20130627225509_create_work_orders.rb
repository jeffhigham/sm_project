class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.integer :property_id
      t.date :due_date
      t.date :completed_date
      t.boolean :heavy_snow
      t.boolean :invliced
      t.boolean :paid
      t.integer :discount
      t.boolean :driveway_only
      t.boolean :salt_on_walk
      t.boolean :notify
      t.string :before_photo
      t.string :after_photo

      t.timestamps
    end
  end
end
