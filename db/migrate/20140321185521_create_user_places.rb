class CreateUserPlaces < ActiveRecord::Migration
  def up
    create_table :user_places do |t|
      t.belongs_to :user
      t.belongs_to :place
      t.integer :times_clicked

      t.timestamps
    end
  end

  def down
    drop_table :user_places
  end
end
