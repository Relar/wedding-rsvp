class Admin::MealsController < ApplicationController
  before_filter :require_user

  active_scaffold :meal do |conf|
  end
end 
