class SessionsController < ApplicationController 
  
  def new
    @user = User.new 
  end 

  # def githubcreate
  #   user = User.from_omniauth(env["omniauth.auth"])

  #   if user.valid?
  #     session[:user_id] = user.id
  #     redirect_to request.env['omniauth.origin']
  #   end
  # end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if user = User.find_by(:email => oauth_email)
        session[:user_id] = user.id
        redirect_to root_path 
      else
        user = User.new(:email => oauth_email, :password => SecureRandom.hex)
        if user.save 
          session[:user_id] = user.id 
          redirect_to root_path 
        else
          raise user.errors.full_messages.inspect
      end 
    end 
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

    
  def destroy 
    session.delete :user_id
    redirect_to root_path
  end 

  private
  
  def auth_hash
    request.env['omniauth.auth']
  end
    
end 
     
    
