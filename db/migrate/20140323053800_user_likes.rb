class UserLikes < ActiveRecord::Migration
  def up
    create_table :user_likes do |t|
      t.belongs_to :user, foreign_key: "uid"
      t.string :category
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :user_likes
  end
end
