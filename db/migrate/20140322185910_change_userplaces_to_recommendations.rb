class ChangeUserplacesToRecommendations < ActiveRecord::Migration
  def up
    rename_table :user_places, :recommendations
    change_table :recommendations do |t|
      t.belongs_to :strategy, null: false
    end
    change_column :recommendations, :user_id, :integer, null: false
    change_column :recommendations, :place_id, :integer, null: false
  end

  def down
    rename_table :recommendations, :user_places
    change_column :recommendations, :user_id, :integer
    change_column :recommendations, :place_id, :integer
  end
end
