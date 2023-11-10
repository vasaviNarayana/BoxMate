class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :username
      t.string :password_digest
      t.string :street_address
      t.string :apt_number
      t.string :city
      t.string :state
      t.string :pin

      t.timestamps null: false
    end
  end
end
