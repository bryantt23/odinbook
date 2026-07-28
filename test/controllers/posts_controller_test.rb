require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get show" do
    post=posts(:one)
    get post_path(post)
    assert_redirected_to new_user_session_path
  end

  test "GET show" do
    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:one)

    post=posts(:one)
    get post_path(post)

    # assert something
    assert_response :success
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
