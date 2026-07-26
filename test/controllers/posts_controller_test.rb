require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    post=posts(:one)
    get post_path(post)
    assert_redirected_to new_user_session_path
  end

  # test "should get index" do
  #   get posts_index_url
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get posts_edit_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get posts_new_url
  #   assert_response :success
  # end
end
