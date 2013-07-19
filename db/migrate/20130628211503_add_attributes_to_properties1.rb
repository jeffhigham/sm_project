class AddAttributesToProperties1 < ActiveRecord::Migration
  def change
    add_column :properties, :primary, :boolean
  end
end
