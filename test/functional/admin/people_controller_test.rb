require 'test_helper'

class Admin::PeopleControllerTest < ActionController::TestCase
  setup do
    @admin_person = admin_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_person" do
    assert_difference('Admin::Person.count') do
      post :create, :admin_person => @admin_person.attributes
    end

    assert_redirected_to admin_person_path(assigns(:admin_person))
  end

  test "should show admin_person" do
    get :show, :id => @admin_person.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_person.to_param
    assert_response :success
  end

  test "should update admin_person" do
    put :update, :id => @admin_person.to_param, :admin_person => @admin_person.attributes
    assert_redirected_to admin_person_path(assigns(:admin_person))
  end

  test "should destroy admin_person" do
    assert_difference('Admin::Person.count', -1) do
      delete :destroy, :id => @admin_person.to_param
    end

    assert_redirected_to admin_people_path
  end
end
