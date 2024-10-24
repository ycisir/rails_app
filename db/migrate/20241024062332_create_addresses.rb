class CreateAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :addresses do |t|
      t.string :add_line1
      t.string :add_line2
      t.string :city
      t.string :zipcode
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
