class RenameStrategyTable < ActiveRecord::Migration
  def up
    rename_table :strategies, :recommendation_strategies
    rename_column :recommendations, :strategy_id, :recommendation_strategy_id
  end

  def down
    rename_table :recommendation_strategies, :strategies
    rename_column :recommendations, :recommendation_strategy_id, :strategy_id
  end
end
