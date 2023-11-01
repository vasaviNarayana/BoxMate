class Customers::SessionsController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.find_by(username: params[:username])

    if @customer && @customer.authenticate(params[:password])
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
  end
end
