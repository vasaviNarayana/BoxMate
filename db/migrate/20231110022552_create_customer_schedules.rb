class CreateCustomerSchedules < ActiveRecord::Migration
  def change
    create_table :customer_schedules do |t|
      t.date :date
      t.string :day
      t.string :meal_name
      t.string :meal_cuisine
      t.string :meal_time
      t.integer :booked_num
      t.references :customer, index: true, foreign_key: true
      t.references :chef, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
