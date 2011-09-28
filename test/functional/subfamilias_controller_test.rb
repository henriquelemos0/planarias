require 'test_helper'

class SubfamiliasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subfamilias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subfamilia" do
    assert_difference('Subfamilia.count') do
      post :create, :subfamilia => { }
    end

    assert_redirected_to subfamilia_path(assigns(:subfamilia))
  end

  test "should show subfamilia" do
    get :show, :id => subfamilias(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => subfamilias(:one).to_param
    assert_response :success
  end

  test "should update subfamilia" do
    put :update, :id => subfamilias(:one).to_param, :subfamilia => { }
    assert_redirected_to subfamilia_path(assigns(:subfamilia))
  end

  test "should destroy subfamilia" do
    assert_difference('Subfamilia.count', -1) do
      delete :destroy, :id => subfamilias(:one).to_param
    end

    assert_redirected_to subfamilias_path
  end
end
