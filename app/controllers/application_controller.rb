class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_session, :current_user, :current_person

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def require_user
      unless current_user
        flash[:notice] = "Please log in to continue."
        redirect_to :admin_login
        return false
      end
      true
    end

    def current_person
      begin
        @current_person ||= Person.find session[:person_id] unless session[:person_id].nil?
      rescue
        session[:person_id] = nil
        redirect_to :root
      end
    end

    def require_person
      unless current_person
        session[:person_id] = nil
        redirect_to :root
      end
    end

end
