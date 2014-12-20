class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.authenticate(params[:email], params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successfully Signed In!"
      redirect_to root_url
    else
      flash.now[:alert] = "Invalid Email/Password Combination!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully Signed Out!"
    redirect_to root_path
  end
end
