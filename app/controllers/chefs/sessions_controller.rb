class Chefs::SessionsController < ApplicationController
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.find_by(username: params[:chef][:username])

    if @chef
      if @chef.authenticate(params[:chef][:password])
        # Successful login
        session[:chef_username] = @chef.username
        flash[:success] = 'Login successful!'
        redirect_to chefs_chefs_home_path
      else
        # Incorrect password
        flash.now[:danger] = 'Invalid password. Please try again.'
        render 'chefs/sessions/new'
      end
    else
      # Username doesn't exist
      flash.now[:danger] = 'Username does not exist. Please sign up.'
      render 'chefs/sessions/new'
    end
  end

  def destroy
    # Implement logout logic here
  end
end
