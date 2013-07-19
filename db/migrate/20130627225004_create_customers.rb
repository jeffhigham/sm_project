class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :home_phone
      t.string :mobile_phone
      t.string :billing

      t.timestamps
    end
  end
end
