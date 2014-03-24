class UpdatePlacesConstraints < ActiveRecord::Migration
  def up
    change_column :places, :name, :string, null: false
    change_column :places, :address, :string, null: false
  end

  def down
    change_column :places, :name, :string
    change_column :places, :address, :string
  end
end
