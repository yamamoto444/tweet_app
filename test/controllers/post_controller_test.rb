require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get post_list_url
    assert_response :success
  end

end
