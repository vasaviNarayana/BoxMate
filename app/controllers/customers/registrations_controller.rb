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
      if Customer.find_by(username: @customer.username)
        flash[:danger] = 'Username already exists. Please choose a different username or go to the login page.'
        render 'customer/registrations/new'
      else
        flash[:danger] = 'Sign up failed. Please check your information. All the fields are required!!'
        render 'customers/registrations/new'
      end
    end
  end

  private

  def customer_params
    params.require(:customer).permit(
      :full_name,
      :username,
      :password,
      :password_confirmation,
      :street_address,
      :apt_number,
      :city,
      :state,
      :pin
    )
  end
end
