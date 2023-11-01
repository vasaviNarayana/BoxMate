class Customers::RegistrationsController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
  end
end
