class SessionsController < ApplicationController
	layout "login"
	
	def create
	  customer = Customer.find_by_email(params[:email])
	  if customer && customer.authenticate(params[:password])
	    session[:customer_id] = customer.id
	    redirect_to customer_path(customer), notice: "Logged in!"
	  else
	  	redirect_to login_path, notice: "Login Failed!"
	  end
	end

	def destroy
  	session[:customer_id] = nil
  	redirect_to  login_path, notice: "Logged out!"
	end

end
