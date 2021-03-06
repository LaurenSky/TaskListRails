require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
    get :create,  {provider: "google"}
  end

  test "Attempting to log in without email should send you to welcome page" do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
    user = request.env['omniauth.auth'][:info]
    user.email = nil

    assert_no_difference('User.count') do
      get :create,  {provider: "google"}
    end
    assert_template :login_failure
  end

  test "Can Create a user" do
    assert_difference('User.count', 1) do
      login_a_user
      assert_response :redirect
      assert_redirected_to sessions_path
      assert_not_nil session[:user_id]
    end
  end

  test "If a user logs in twice it doesn't create a 2nd user" do
    assert_difference('User.count', 1) do
      login_a_user
    end

    assert_no_difference('User.count') do
      login_a_user
      assert_response :redirect
      assert_redirected_to sessions_path
      assert_not_nil session[:user_id]
    end
  end

  test "If a user logs out user_id should be nil and should be redirected to the right place" do
    login_a_user
    get :destroy

    assert_response :redirect
    assert_redirected_to root_path
    assert_nil session[:user_id]
  end
end
