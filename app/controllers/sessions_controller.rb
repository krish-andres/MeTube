class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.authenticate(params[:email], params[:password])
      flash[:notice] = "Successfully Signed In!"
      session[:user_id] = @user.id
      redirect_to root_path
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
