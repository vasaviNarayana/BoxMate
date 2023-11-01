class Customers::RegistrationsController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      # Successful signup
      flash[:success] = 'Sign up successful! You can now log in.'
      redirect_to customers_login_path
    else
      if @customer.errors[:username].include?("has already been taken")
        flash.now[:danger] = 'Username is already taken. Please choose a different username.'
      else
        flash.now[:danger] = 'Sign up failed. Please check your information.'
      end
      render 'customers/registrations/new'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:username, :password, :password_confirmation)
  end
end
