class AddRecentPositionToUserTable < ActiveRecord::Migration
  def up
    add_column :users, :recent_latitude, :decimal, precision: 10, scale: 6
    add_column :users, :recent_longitude, :decimal, precision: 10, scale: 6
  end

  def down
    remove_column :users, :recent_longitude
    remove_column :users, :recent_latitude
  end
end
