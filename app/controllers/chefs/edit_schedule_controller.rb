# app/controllers/chefs/edit_schedule_controller.rb

class Chefs::EditScheduleController < ApplicationController
    before_action :find_schedule, only: [:edit, :update]
    
    def new
      @chef_schedule = ChefSchedule.new
      @mealCount = 1
    end

  def create
    current_chef_username = session[:chef_username]
    current_chef = Chef.find_by(username: current_chef_username)

    date = params[:chef_schedule][:date]
    meal_time = params[:chef_schedule][:meal_time]

    meals_attributes = params[:chef_schedule][:meals_attributes] || {}

    # Iterate through each meal submitted in the form
    # meals_attributes.each do |_, meals_attributes|
      meal_name = meals_attributes[:meal_name]
      meal_cuisine = meals_attributes[:meal_cuisine]
      meal_price = meals_attributes[:meal_price]
      meal_recurrence = meals_attributes[:meal_recurrence]
      max_num = meals_attributes[:max_num]

      # Check if a ChefSchedule entry already exists for the given date, meal_time, meal_name, and meal_cuisine
      if ChefSchedule.exists?(chef: current_chef, date: date, meal_time: meal_time, meal_name: meal_name, meal_cuisine: meal_cuisine)
        # Display flash message for non-unique combination
        flash[:danger] = "Meal with the same details already exists for the selected date and time."
        
        # Render the form again
        render :new
        return
      end

      # Check if a ChefSchedule entry already exists for the given date and meal_time
      chef_schedule = ChefSchedule.find_by(chef: current_chef, date: date, meal_time: meal_time)

      if chef_schedule
        # ChefSchedule entry exists, update the existing entry with the new meal
        chef_schedule.update(
         meal_name: meal_name, meal_cuisine: meal_cuisine, meal_price: meal_price, meal_recurrence: meal_recurrence, max_num: max_num
        )
      else
        # ChefSchedule entry doesn't exist, create a new entry with the meal
        ChefSchedule.create(
          chef: current_chef,
          date: date,
          meal_time: meal_time,
           meal_name: meal_name, meal_cuisine: meal_cuisine, meal_price: meal_price, meal_recurrence: meal_recurrence, max_num: max_num
        )
      end
    # end

    # Redirect to chefs_home path after successful creation
    redirect_to chefs_chefs_home_path
  end
  
    private
  
    def chef_sched_params
      params.require(:chef_schedule).permit(:date, :meal_time, :meal_name, :meal_cuisine, :meal_price, :meal_recurrence, :max_num)
    end
  end
  