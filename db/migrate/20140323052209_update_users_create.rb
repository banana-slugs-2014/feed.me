class UpdateUsersCreate < ActiveRecord::Migration
  def up
    add_column :users, :age_range, :integer
    add_column :users, :location, :string
    add_column :users, :gender, :string
  end

  def down
    remove_column :users, :age_range
    remove_column :users, :location
    remove_column :users, :gender
  end
end
