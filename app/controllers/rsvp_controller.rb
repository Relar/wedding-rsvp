class RsvpController < ApplicationController

  before_filter :require_person, :except => [:index]

  def index
    session[:person_id] = nil
    @person = Person.new
    if request.post?
      @person = Person.where(:is_adult => true).find(:first, :conditions => ["lower(first_name) = ? and lower(last_name) = ?", params[:person][:first_name].downcase, params[:person][:last_name].downcase])
      if @person.nil?
        flash[:notice] = "Sorry, you're not cool enough."
      else
        session[:person_id] = @person.id
        redirect_to :action => :disclaimer
      end
    end
  end

  def disclaimer
    if current_person.family.people.delete_if { |member| !member.is_invited_ceremony }.empty?
      redirect_to :action => :details
    end
    if request.post?
      if params[:disclaimer][:agree] == "1"
        session[:disclaimer_agreed] = true
        redirect_to :action => :details
      else
        flash[:notice] = "You must read and agree to this information before continuing."
      end
    end
  end

  def details
    @family = Person.find(session[:person_id]).family
    unless params[:family].nil?
      flash[:notice] = "Saved!"
      @family.attributes = params[:family]
      @family.save!
      redirect_to :action => :confirm
    end
    @family.reload
  end

  def confirm
    @family = Person.find(session[:person_id]).family
  end

  def finished
    session[:person_id] = nil
  end

end
