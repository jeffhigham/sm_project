class CreateSidewalkLengths < ActiveRecord::Migration
  def change
    create_table :sidewalk_lengths do |t|
      t.text :name
      t.integer :feet

      t.timestamps
    end
  end
end
