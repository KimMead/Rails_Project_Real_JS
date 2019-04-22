require 'pry'
class UsersController < ApplicationController
  
  def index
    @users = User.all 
  end 
  
  def new
    @user = User.new
  end 
   
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to users_path(@user)
  end 

  def show    
    @user = User.find(params[:id])    
      if @user != current_user       
    redirect_to root_path  
    end   
  end
  
    private
    def user_params
      params.require(:user).permit(:email, :name, :password)
    end
  end 
