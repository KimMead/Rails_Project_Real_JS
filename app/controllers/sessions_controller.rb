class SessionsController < ApplicationController 
    
  def new
    @user = User.new 
  end 
    
  def create
    @user = User.find_by(email: params[:user][:email])
    if params[:user][:email] == "" || params[:user][:password] == ""
      redirect_to signin_path
    elsif @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def fbcreate
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = auth['uid']  
    end
    
    session[:user_id] = @user.id

    redirect_to '/attractions'
  end
    
  def destroy 
    session.delete :user_id
    redirect_to root_path
  end 

  private
  
  def auth
    request.env['omniauth.auth']
  end
    
end 
     
    
