class Person < ActiveRecord::Base
  belongs_to :family
  belongs_to :meal

  before_save do |person|
    if person.is_guest and !person.is_guest_attending
      person.is_attending_ceremony = false
      person.is_attending_reception = false
    end
  end

  def name
    unless self.first_name.to_s.empty? and self.last_name.to_s.empty?
      [self.first_name, self.last_name].join ' '
    else
      "Unnamed Guest"
      #self.first_name = "Unnamed", self.last_name = "Guest"
    end
  end

  def adult?
    self.is_adult
  end

  def invited_ceremony?
    self.is_invited_ceremony
  end

  def attending_ceremony?
    self.is_attending_ceremony
  end

  def attending_reception?
    self.is_attending_reception
  end
end
