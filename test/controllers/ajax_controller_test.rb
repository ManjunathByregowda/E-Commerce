require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get find_by_categories" do
    get :find_by_categories
    assert_response :success
  end

end
