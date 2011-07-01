class Admin::AttendeesController < ApplicationController

  def index
  
  end

  def ceremony
    @people = Person.where(:is_attending_ceremony => true)
  end

  def reception
    @people = Person.where(:is_attending_reception => true)
  end
end
