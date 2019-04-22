class SessionsController < ApplicationController 
    # before_action :require_login

    def create 
        @user = User.find_by(name: params[:name])
        if @user && authenticate(params[:password]) 
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
    
    private
     
    def require_login
        return head(:forbidden) unless session.include? :user_id
        if !logged_in?
            flash[:error] = "You must be logged in to view this page."
            redirect_to signin_path
        end
    end
end 