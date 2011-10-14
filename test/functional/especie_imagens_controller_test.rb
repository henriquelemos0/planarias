# -*- encoding : utf-8 -*-
require 'test_helper'

class EspecieImagensControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:especie_imagens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create especie_imagem" do
    assert_difference('EspecieImagem.count') do
      post :create, :especie_imagem => { }
    end

    assert_redirected_to especie_imagem_path(assigns(:especie_imagem))
  end

  test "should show especie_imagem" do
    get :show, :id => especie_imagens(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => especie_imagens(:one).to_param
    assert_response :success
  end

  test "should update especie_imagem" do
    put :update, :id => especie_imagens(:one).to_param, :especie_imagem => { }
    assert_redirected_to especie_imagem_path(assigns(:especie_imagem))
  end

  test "should destroy especie_imagem" do
    assert_difference('EspecieImagem.count', -1) do
      delete :destroy, :id => especie_imagens(:one).to_param
    end

    assert_redirected_to especie_imagens_path
  end
end
