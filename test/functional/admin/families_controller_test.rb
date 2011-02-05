require 'test_helper'

class Admin::FamiliesControllerTest < ActionController::TestCase
  setup do
    @admin_family = admin_families(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_families)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_family" do
    assert_difference('Admin::Family.count') do
      post :create, :admin_family => @admin_family.attributes
    end

    assert_redirected_to admin_family_path(assigns(:admin_family))
  end

  test "should show admin_family" do
    get :show, :id => @admin_family.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_family.to_param
    assert_response :success
  end

  test "should update admin_family" do
    put :update, :id => @admin_family.to_param, :admin_family => @admin_family.attributes
    assert_redirected_to admin_family_path(assigns(:admin_family))
  end

  test "should destroy admin_family" do
    assert_difference('Admin::Family.count', -1) do
      delete :destroy, :id => @admin_family.to_param
    end

    assert_redirected_to admin_families_path
  end
end
