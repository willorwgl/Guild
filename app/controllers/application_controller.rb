class ApplicationController < ActionController::Base

    helper_method :current_user, :selected_character, :logged_in?
    skip_before_action :verify_authenticity_token
    
    def current_user
        @current_user ||= User.includes(:characters).find_by_session_token(session[:session_token])
    end

    def selected_character
        current_user.characters.find_by(selected: true)
    end

    def selected_realm 
        selected_character._realm
    end

    def ensure_logged_in
        redirect_to "/" unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def login(user)
        @current_user = user
        
        session[:session_token] = @current_user.reset_session_token!
    end

    def logout
        current_user.reset_session_token!
        @current_user = nil
        session[:session_token] = nil
    end

end
