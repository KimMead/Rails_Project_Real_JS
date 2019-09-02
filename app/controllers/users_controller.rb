class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show]
  
  def new
    @user = User.new
  end 

  def show 
    @user = current_user
  end 
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      # redirect_to attractions_path 
    else
      render :new
    end
  end 

  private

  def user_params
      params.require(:user).permit(:email, :name, :password)
    end
  end 
