class AddAttributesToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :city, :string
    add_column :properties, :state, :string
    add_column :properties, :zip, :string
    add_column :properties, :public_record_url, :string
    add_column :properties, :notes, :text
  end
end
