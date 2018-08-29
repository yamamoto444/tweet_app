require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get posts_list_url
    assert_response :success
  end

end
