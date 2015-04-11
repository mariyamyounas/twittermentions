require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get clear" do
    get :clear
    assert_response :success
  end

end
