class CompanyUrlColumn < ActiveRecord::Migration
  def change
    add_column :places, :company_url, :string
  end
end
