class UpdateUsersCreate < ActiveRecord::Migration
  def up
    add_column :users, :age_range, :integer
    add_column :users, :location, :string
    add_column :users, :gender, :string
  end

  def down
  end
end
