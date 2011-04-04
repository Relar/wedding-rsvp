class Person < ActiveRecord::Base
  belongs_to :family, :inverse_of => :people
  belongs_to :meal

  before_save do
    return true
    if self.is_guest and !self.is_guest_attending
      self.is_attending_ceremony = false
      self.is_attending_reception = false
    end
    true
  end

  before_save do
    self.first_name = self.first_name.strip
    self.last_name = self.last_name.strip
  end

  def name
    unless self.first_name.to_s.empty? and self.last_name.to_s.empty?
      [self.first_name, self.last_name].join ' '
    else
      "Unnamed Guest"
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
