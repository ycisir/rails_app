class CreateManufacturers < ActiveRecord::Migration[7.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
    end
  end
end
