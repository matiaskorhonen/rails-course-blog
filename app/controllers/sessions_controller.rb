class SessionsController < ApplicationController
  def new
  end
  
  # Login
  def create
    email = params[:session][:email]
    password = params[:session][:password]
    user = User.authenticate(email, password)
    
    if user # If authentication is successful
      session[:user_id] = user.id
      flash[:notice] = "You've been logged in."
      redirect_to session[:referrer] || :root
    else # If wrong credentials
      flash[:error] = "Wrong credentials, please try again."
      render :action => "new"
    end
  end
  
  # Log out
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out."
    redirect_to :root
  end
end
