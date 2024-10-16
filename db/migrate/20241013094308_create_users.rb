class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.integer :age

      t.timestamps
    end
  end
end
