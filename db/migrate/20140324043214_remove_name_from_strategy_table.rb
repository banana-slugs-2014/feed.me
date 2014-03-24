class RemoveNameFromStrategyTable < ActiveRecord::Migration
  def up
    remove_column :recommendation_strategies, :name
  end

  def down
    add_column :recommendation_strategies, :name, :string
  end
end
