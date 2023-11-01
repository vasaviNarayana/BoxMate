class Customers::SessionsController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.find_by(username: params[:customer][:username])

    if @customer && @customer.authenticate(params[:customer][:password])
      # Successful login
      flash[:success] = 'Login successful!'
      redirect_to customers_dashboard_path
    else
      # Failed login
      flash.now[:danger] = 'Invalid username or password. Please sign up.'
      render 'customers/sessions/new'
    end
  end

  def destroy
  end
end
