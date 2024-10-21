class AddManufacturerIdToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :manufacturer_id, :integer
  end
end
