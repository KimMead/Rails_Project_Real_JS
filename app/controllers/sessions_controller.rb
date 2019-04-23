class SessionsController < ApplicationController 
    before_action :require_login

    def new
    end 
    
    def create
        @user = User.find_by(email: params[:user][:email])
        # if params[:user][:email] == "" || params[:user][:password] == ""
        #   redirect_to signin_path, :flash => { :error => "Please enter all fields."}
        if @user && @user.try(:authenticate, params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          puts "How dare you!"
        #   redirect_to signin_path, :flash => { :error => "Incorrect username/password. Please try again."}
        end
      end
    
    def destroy 
        session.delete :user_id
        redirect_to root_path
    end 
    
    private
     
    def require_login
        return head(:forbidden) unless session.include? :user_id
        
    end
end
