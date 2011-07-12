class Admin::AttendeesController < ApplicationController

  def index
  
  end

  def ceremony
    @people = Person.order('last_name').where(:is_attending_ceremony => true)
  end

  def reception
    @people = Person.order('last_name').where(:is_attending_reception => true)
  end

  def meals
    @people = Person.where(:is_attending_reception => true)
    @meals = Meal.all
  end
end
