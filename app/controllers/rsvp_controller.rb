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
      redirect_to :action => :guest
    end 
    if request.post?
      if params[:disclaimer][:agree] == "1"
        @current_person.family.update_attributes :accepted_disclaimer => true
        redirect_to :action => :guest
      else
        flash[:notice] = "Please review this information before you continue, it contains important ceremony information."
      end
    end
  end

  def guest
    @family = Person.find(session[:person_id]).family
    if current_person.family.guests.empty?
      redirect_to :action => :details
      return
    end 
    unless params[:family].nil?
      flash[:notice] = "Saved!"
      @family.attributes = params[:family]
      @family.save!
      redirect_to :action => :details #after guest stuff is filled out
    end
  end

  def details
    @family = Person.find(session[:person_id]).family
    unless params[:family].nil?
      flash[:notice] = "Saved!"
      @family.attributes = params[:family]
      @family.save!
      redirect_to :action => :confirm
      return
    end

    ar_true = ActiveRecord::Base.connection.quoted_true
    ar_false = ActiveRecord::Base.connection.quoted_false
    @invitees = @family.people.where("not (is_guest = #{ar_true} and guest_is_attending = #{ar_false})")
  end

  def confirm
    @family = Person.find(session[:person_id]).family
  end

  def finished
    session[:person_id] = nil
  end

end
