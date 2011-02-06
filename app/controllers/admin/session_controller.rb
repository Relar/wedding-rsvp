class Admin::SessionController < ApplicationController
  def login
    if params[:login]
      begin
        if UserSession.create! params[:login]
          redirect_to :admin_root
        end
      rescue Authlogic::Session::Existence::SessionInvalidError => e
        flash[:error] = "Sorry, please try again." #e.message
      end
    end
  end

  def logout
    current_user_session.destroy
    redirect_to :admin_login
  end

  def index
  end
 
end
