class RsvpController < ApplicationController

  before_filter :require_person, :except => [:index]

  def index
    session[:person_id] = nil
    @person = Person.new
    if request.post?
      @person = Person.where(:is_adult => true).find(:first, :conditions => ["lower(first_name) = ? and lower(last_name) = ?", params[:person][:first_name].downcase, params[:person][:last_name].downcase])
      if @person.nil?
        flash[:notice] = "I'm sorry, I can't seem to find your record."
      else
        session[:person_id] = @person.id
        redirect_to :action => :disclaimer
      end
    end
  end

  def disclaimer
    @jquery = true
    if current_person.family.people.where(:is_invited_ceremony => true).count == 0 or current_person.family.accepted_disclaimer
      redirect_to :action => :details
    end 
    if request.post?
      if params[:disclaimer][:agree] == "1"
        @current_person.family.update_attributes :accepted_disclaimer => true
         redirect_to :action => :details
      else
        flash[:notice] = "Please review this information before you continue, it contains important ceremony information."
      end
    end
  end

  def details
    @jquery = true
    @family = Person.find(session[:person_id]).family
    unless params[:family].nil?
      @family.attributes = params[:family]
      @family.save!
      flash[:notice] = "Saved!"
      redirect_to :action => :confirm
      return
    end
  end

  def confirm
    @family = Person.find(session[:person_id]).family
  end

  def finished
    session[:person_id] = nil
  end

end
