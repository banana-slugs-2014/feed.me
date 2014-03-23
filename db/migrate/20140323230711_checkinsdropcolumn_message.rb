class CheckinsdropcolumnMessage < ActiveRecord::Migration
  def up
    remove_column :checkins, :message
  end

  def down
  end
end
