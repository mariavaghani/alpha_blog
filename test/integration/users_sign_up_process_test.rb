require "test_helper"

class UsersSignUpProcessTest < ActionDispatch::IntegrationTest

  test "sign in to the application" do

    get signup_path
    assert_response :success
    assert_difference "User.count", 1 do
      post '/users', params: { user: { username: "johndoe", email: "johndoe@gmail.com", password: 'password'}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "johndoe", response.body
  end
end
