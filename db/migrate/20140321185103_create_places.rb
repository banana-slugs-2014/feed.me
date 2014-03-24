class CreatePlaces < ActiveRecord::Migration
  # Really?  No defaults?  All are legit to be NULL?
  def up
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :types
      t.string :phone_num
      t.string :company_url
      t.string :menu_url
      t.integer :postal_code
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
    end
  end

  def down
    drop_table :places
  end
end
