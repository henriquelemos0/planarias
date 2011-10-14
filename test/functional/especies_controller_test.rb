# -*- encoding : utf-8 -*-
require 'test_helper'

class EspeciesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:especies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create especie" do
    assert_difference('Especie.count') do
      post :create, :especie => { }
    end

    assert_redirected_to especie_path(assigns(:especie))
  end

  test "should show especie" do
    get :show, :id => especies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => especies(:one).to_param
    assert_response :success
  end

  test "should update especie" do
    put :update, :id => especies(:one).to_param, :especie => { }
    assert_redirected_to especie_path(assigns(:especie))
  end

  test "should destroy especie" do
    assert_difference('Especie.count', -1) do
      delete :destroy, :id => especies(:one).to_param
    end

    assert_redirected_to especies_path
  end
end
