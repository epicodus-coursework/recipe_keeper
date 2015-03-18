class SessionsController < ApplicationController
  def create    
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "You've been logged in."
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to sessions_path
    end
  end
end
