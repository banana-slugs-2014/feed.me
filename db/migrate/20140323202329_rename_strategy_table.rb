class RenameStrategyTable < ActiveRecord::Migration
  def up
    rename_table :strategies, :recommendation_strategies
  end

  def down
    rename_table :recommendation_strategies, :strategies
  end
end
