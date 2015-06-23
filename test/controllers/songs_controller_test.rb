require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  test "should get vote" do
    get :vote
    assert_response :success
  end

  test "should get upload" do
    get :upload
    assert_response :success
  end

  test "should get play" do
    get :play
    assert_response :success
  end

end
