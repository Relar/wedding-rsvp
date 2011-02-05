class Person < ActiveRecord::Base
    belongs_to :family
    belongs_to :meal

    def name
      "#{self.first_name} #{self.last_name}"
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
