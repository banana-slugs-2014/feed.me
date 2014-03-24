class DropUserPlacesTable < ActiveRecord::Migration
  def up
    drop_table :user_places
  end

  def down
  end
end
