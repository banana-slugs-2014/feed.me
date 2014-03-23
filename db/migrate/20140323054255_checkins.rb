class Checkins < ActiveRecord::Migration
  def up
    create_table :checkins do |t|
      t.belongs_to :user, foreign_key: "uid"
      t.string :message
      t.string :city
      t.string :country
      t.string :longitude, :precision => 10, :scale => 6
      t.string :latitude,  :precision => 10, :scale => 6

      t.timestamps
    end
  end

  def down
    drop_table :checkins
  end
end
