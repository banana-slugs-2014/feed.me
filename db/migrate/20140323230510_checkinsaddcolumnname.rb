class Checkinsaddcolumnname < ActiveRecord::Migration
  def up
    add_column :checkins, :name, :string
  end

  def down
    remove_column :checkins, :name
  end
end
