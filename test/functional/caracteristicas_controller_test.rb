# -*- encoding : utf-8 -*-
require 'test_helper'

class CaracteristicasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caracteristicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caracteristica" do
    assert_difference('Caracteristica.count') do
      post :create, :caracteristica => { }
    end

    assert_redirected_to caracteristica_path(assigns(:caracteristica))
  end

  test "should show caracteristica" do
    get :show, :id => caracteristicas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => caracteristicas(:one).to_param
    assert_response :success
  end

  test "should update caracteristica" do
    put :update, :id => caracteristicas(:one).to_param, :caracteristica => { }
    assert_redirected_to caracteristica_path(assigns(:caracteristica))
  end

  test "should destroy caracteristica" do
    assert_difference('Caracteristica.count', -1) do
      delete :destroy, :id => caracteristicas(:one).to_param
    end

    assert_redirected_to caracteristicas_path
  end
end
