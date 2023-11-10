# app/controllers/chefs/home_controller.rb
class Chefs::HomeController < ApplicationController
  def index
    @selected_date = params[:selected_date] ? Date.parse(params[:selected_date]) : Date.today
    update_schedule
  end

  def update_schedule
    selected_date = params[:selected_date] ? Date.parse(params[:selected_date]) : Date.today
    @day_schedules = current_chef.chef_schedules.where(date: selected_date..(selected_date + 6.days))

    respond_to do |format|
      format.html
      format.json { render json: @day_schedules }
    end
  end
end
