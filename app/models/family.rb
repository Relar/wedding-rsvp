class Family < ActiveRecord::Base
    has_many :adults, :class_name => "Person", :conditions => {:is_adult => false}
    has_many :children, :class_name => "Person", :conditions => {:is_adult => false}
    has_many :members, :class_name => "Person", :dependent => :delete_all

    accepts_nested_attributes_for :adults, :children, :members, :update_only => true
end
