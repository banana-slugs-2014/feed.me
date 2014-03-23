class CreatePlaces < ActiveRecord::Migration
  def up
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :types
      t.string :phone_num
      t.string :company_url
      t.string :menu_url
      t.integer :postal_code
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end

  def down
    drop_table :places
  end
end
