class SessionsController < ApplicationController 
  
    
  def new
    @user = User.new 
  end 
    
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Incorrect email or password"
      redirect_to '/signin'
    end
  end

  def githubcreate
    user = User.find_or_create_by(:provider => auth[:provider], :uid => auth[:uid]) do |user|
      user.name = auth[:info][:name]
  end 

    session[:user_id] = user.id

    redirect_to user_path(@user)
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
     
    
