class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :full_name
      t.string :username
      t.string :password_digest
      t.string :street_address
      t.string :apt_number
      t.string :city
      t.string :state
      t.string :pin
      t.decimal :chef_rating, precision: 3, scale: 1

      t.timestamps null: false
    end
  end
end
