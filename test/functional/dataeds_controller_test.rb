require 'test_helper'

class DataedsControllerTest < ActionController::TestCase
  setup do
    @dataed = dataeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dataeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dataed" do
    assert_difference('Dataed.count') do
      post :create, :dataed => @dataed.attributes
    end

    assert_redirected_to dataed_path(assigns(:dataed))
  end

  test "should show dataed" do
    get :show, :id => @dataed.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dataed.to_param
    assert_response :success
  end

  test "should update dataed" do
    put :update, :id => @dataed.to_param, :dataed => @dataed.attributes
    assert_redirected_to dataed_path(assigns(:dataed))
  end

  test "should destroy dataed" do
    assert_difference('Dataed.count', -1) do
      delete :destroy, :id => @dataed.to_param
    end

    assert_redirected_to dataeds_path
  end
end
