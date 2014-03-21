class Createusers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :uid, null: false
      t.string :oauth_token, null: false

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
