require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get authentication_signin_url
    assert_response :success
  end

  test "should get signup" do
    get authentication_signup_url
    assert_response :success
  end
end
