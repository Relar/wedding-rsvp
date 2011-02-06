class Admin::PeopleController < ApplicationController
  before_filter :require_user

  active_scaffold :person do |conf|
  end
end 
