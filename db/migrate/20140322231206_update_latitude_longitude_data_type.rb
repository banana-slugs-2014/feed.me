class UpdateLatitudeLongitudeDataType < ActiveRecord::Migration
  def up
    change_column :places, :latitude, :decimal, precision: 10, scale: 6
    change_column :places, :longitude, :decimal, precision: 10, scale: 6
  end

  def down
    change_column :places, :latitude, :integer
    change_column :places, :longitude, :integer
  end
end
