class Chefs::SessionsController < ApplicationController
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.find_by(username: params[:chef][:username])

    if @chef && @chef.authenticate(params[:chef][:password])
      # Successful login
      flash[:success] = 'Login successful!'
      redirect_to chefs_dashboard_path
    else
      # Failed login
      flash.now[:danger] = 'Invalid username or password. Please sign up.'
      render 'chefs/sessions/new'
    end
  end

  def destroy
    # Handle logout logic here
  end
end
