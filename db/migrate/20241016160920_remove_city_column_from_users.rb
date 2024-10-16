class RemoveCityColumnFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :city
  end
end
