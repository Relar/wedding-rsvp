class Meal < ActiveRecord::Base
  has_many :people, :order => 'last_name'
end
