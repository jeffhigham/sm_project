class AddImageUrlToDrivewayTypes < ActiveRecord::Migration
  def change
    add_column :driveway_types, :image_url, :text, :default => "http://placehold.it/100x100&text=House"
  end
end
