class AddCityColumnToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :city_id, :integer
  end
end
