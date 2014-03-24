class ChangeMenuUrlColumn < ActiveRecord::Migration
  def up
    change_column :places, :menu_url, :text
    change_column :places, :types, :text
  end

  def down
    change_column :places, :menu_url, :string
    change_column :places, :types, :string

  end
end
