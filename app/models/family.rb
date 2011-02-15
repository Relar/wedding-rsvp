class Family < ActiveRecord::Base
    has_many :adults, :class_name => "Person", :conditions => {:is_adult => false}
    has_many :children, :class_name => "Person", :conditions => {:is_adult => false}
    has_many :guests, :class_name => "Person", :conditions => {:is_guest => true}
    has_many :people, :dependent => :delete_all

    accepts_nested_attributes_for :adults, :children, :people, :update_only => true
end
