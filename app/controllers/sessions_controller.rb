class SessionsController < ApplicationController 
    
  def new
    @user = User.new
    render :signin 
  end 
    
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end
    
  def destroy 
    session.delete :user_id
    redirect_to root_path
  end 
    
end 
     
    
