module ApplicationHelper
    
    def current_user 
        @current_user ||= User.find_by_id(session[:user_id]) 
      end 
    
      def logged_in?
        !!session[:user_id]
      end

      def set_user
        @user = current_user
      end

      def require_login
        if !logged_in?
          redirect_to signin_path
        end
      end
end
