class Customers::SessionsController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.find_by(username: params[:customer][:username])

    if @customer
      if @customer.authenticate(params[:customer][:password])
        # Successful login
        session[:customer_username] = @customer.username
        flash[:success] = 'Login successful!'
        redirect_to customers_home_path
      else
        # Incorrect password
        flash.now[:danger] = 'Invalid password. Please try again.'
        render 'customers/sessions/new'
      end
    else
      # Username doesn't exist
      flash.now[:danger] = 'Username does not exist. Please sign up.'
      render 'customers/sessions/new'
    end
  end

  def destroy
    session[:customer_username] = nil
    redirect_to root_path, notice: 'Logged out successfully'
  end
end
