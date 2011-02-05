class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_known_person
    if session[:person_id].nil? or Person.where(:id => session[:person_id]).count == 0
      flash[:notice] = "You are not authorized."
      session[:person_id] = nil
      redirect_to :root
    end
  end
end
