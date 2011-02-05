require 'test_helper'

class RsvpControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get disclaimer" do
    get :disclaimer
    assert_response :success
  end

  test "should get rsvp" do
    get :rsvp
    assert_response :success
  end

  test "should get confirm" do
    get :confirm
    assert_response :success
  end

end
