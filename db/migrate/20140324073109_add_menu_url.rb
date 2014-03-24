class AddMenuUrl < ActiveRecord::Migration
  def change
    add_column :places, :menu_url, :string
  end
end
