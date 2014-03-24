# I would delete this file.  You dont' back your Strategies with AR, do you?
#
class CreateStrategyTable < ActiveRecord::Migration
  def up
    create_table :strategies do |t|
      t.string :name
      t.string :type
      t.timestamps
    end
  end

  def down
    drop_table :strategies
  end
end
