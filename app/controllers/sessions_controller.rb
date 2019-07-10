class SessionsController < ApplicationController 
  
  def new
    @user = User.new 
  end 

  def create
    
    if params[:provider] == 'github'
      @user = User.create_by_github_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
 
    @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user) 
      else
        flash[:notice] = "Incorrect email or password"
        redirect_to '/signin'
      end 
    end 
  end 

  def omniauth
    @user = User.create_by_github_omniauth(auth)

    session[:user_id] = @user.id
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
     
    
