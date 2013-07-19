class AddPaperclipToStuff < ActiveRecord::Migration
  def change
        remove_column :properties, :profile_photo
        remove_column :work_orders, :before_photo
        remove_column :work_orders, :after_photo
        add_attachment :customers, :profile_photo
        add_attachment :properties, :profile_photo_1
        add_attachment :properties, :profile_photo_2
        add_attachment :work_orders, :before_photo
        add_attachment :work_orders, :after_photo
  end
end
