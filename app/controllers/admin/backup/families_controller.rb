class Admin::FamiliesController < ApplicationController
  before_filter :require_user

  active_scaffold :family do |conf|
  end
end 
