require 'pry'
class UsersController < ApplicationController
  helper_method :logged_in?, :current_user 

  def new
    @user = User.new
  end 
   
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show  
    set_user
  end 
  
    private
    def user_params
      params.require(:user).permit(:email, :name, :password)
    end
  end 
