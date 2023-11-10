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
      if Chef.find_by(username: @chef.username)
        flash[:danger] = 'Username already exists. Please choose a different username or go to the login page.'
        render 'chefs/registrations/new'
      else
        flash[:danger] = 'Sign up failed. Please check your information. All the fields are required!!'
        render 'chefs/registrations/new'
      end
    end
  end

  private

  def chef_params
    params.require(:chef).permit(
      :full_name,
      :username,
      :password,
      :street_address,
      :apt_number,
      :city,
      :state,
      :pin
    )
  end
end
