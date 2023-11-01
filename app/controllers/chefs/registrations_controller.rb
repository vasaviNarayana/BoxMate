class Chefs::RegistrationsController < ApplicationController
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
  
    if @chef.save
      flash[:success] = 'Sign up successful! You can now log in.'
      redirect_to chefs_login_path
    else
      if @chef.errors[:username].include?("has already been taken")
        flash.now[:danger] = 'Username is already taken. Please choose a different username.'
      else
        flash.now[:danger] = 'Sign up failed. Please check your information.'
      end
      render 'chefs/registrations/new'
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:username, :password, :password_confirmation)
  end
end
