class CreateChefSchedules < ActiveRecord::Migration
  def change
    create_table :chef_schedules do |t|
      t.date :date
      t.string :day
      t.string :meal_name
      t.string :meal_cuisine
      t.string :meal_time
      t.decimal :meal_price, precision: 5, scale: 2
      t.string :meal_recurrence
      t.integer :max_num
      t.integer :booked_num
      t.references :chef, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
