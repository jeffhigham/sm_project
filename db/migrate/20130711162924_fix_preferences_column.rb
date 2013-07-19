class FixPreferencesColumn < ActiveRecord::Migration
  def up
    rename_column :work_orders, :removal_preference_id, :removal_preferences_id
  end

  def down
  end
end
