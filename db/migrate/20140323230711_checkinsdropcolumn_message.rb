class CheckinsdropcolumnMessage < ActiveRecord::Migration
  def up
    remove_column :checkins, :message
  end

  def down
    add_column :checkings, :message, :string
  end
end
