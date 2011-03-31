class Family < ActiveRecord::Base
    has_many :adults, :class_name => "Person", :conditions => {:is_adult => true}
    has_many :children, :class_name => "Person", :conditions => {:is_adult => false}
    has_many :guests, :class_name => "Person", :conditions => {:is_guest => true}
    has_many :people, :dependent => :delete_all, :inverse_of => :family

    accepts_nested_attributes_for :people, :allow_destroy => true, :reject_if => :all_blank

    validates_presence_of :phone, :street_address
end
