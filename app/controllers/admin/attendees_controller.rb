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

  def notattending
    @notceremony = Family.where(['phone != ?', '']).collect(&:people).flatten.select do |person|
      !person.is_guest? and !person.is_attending_ceremony? and person.is_invited_ceremony?
    end
    @notreception = Family.where(['phone != ?', '']).collect(&:people).flatten.select do |person|
      !person.is_guest? and !person.is_attending_reception?
    end
    @peopleunsure = Family.where(:phone => [nil, '']).collect(&:people).flatten.reject(&:is_guest?)
  end
end
