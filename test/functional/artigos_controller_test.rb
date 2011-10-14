# -*- encoding : utf-8 -*-
require 'test_helper'

class ArtigosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artigos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artigo" do
    assert_difference('Artigo.count') do
      post :create, :artigo => { }
    end

    assert_redirected_to artigo_path(assigns(:artigo))
  end

  test "should show artigo" do
    get :show, :id => artigos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => artigos(:one).to_param
    assert_response :success
  end

  test "should update artigo" do
    put :update, :id => artigos(:one).to_param, :artigo => { }
    assert_redirected_to artigo_path(assigns(:artigo))
  end

  test "should destroy artigo" do
    assert_difference('Artigo.count', -1) do
      delete :destroy, :id => artigos(:one).to_param
    end

    assert_redirected_to artigos_path
  end
end
