class Chefs::ChefsHomeController < ApplicationController
  def index
    @week_schedule = current_chef.chef_schedules.where(date: Date.today.beginning_of_week..Date.today.end_of_week)
  end
end
