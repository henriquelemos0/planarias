require 'test_helper'

class ExportarControllerTest < ActionController::TestCase
  test "should get alternativas_especies" do
    get :alternativas_especies
    assert_response :success
  end

end
