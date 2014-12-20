class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :set_user, except: [:index, :new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully Created Account!"
    else
      flash.now[:alert] = "There was a problem creating your account. Please try again."  
      render :new
    end
  end

  def index
    @users = User.all.order("email ASC")
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to @user, notice: "Successfully Updated Account!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Successfully Deleted Account!"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def require_correct_user
    unless current_user?(@user)
      redirect_to root_url, alert: "Unauthorized Access!"
    end
  end
end
