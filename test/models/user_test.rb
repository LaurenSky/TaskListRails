require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Create a user with a uid, email and provider" do
    user = users(:one)
    assert user.valid?
  end

  test "Cannot create a user with only email and provider" do
    user = users(:one)
    user.uid = nil
    assert_not user.valid?
  end

  test "Cannot create a user with only uid and provider" do
    user = users(:one)
    user.email = nil
    assert_not user.valid?
  end

  test "Cannot create a user with only uid and email" do
    user = users(:one)
    user.provider = nil
    assert_not user.valid?
  end

  test "User can have no tasks" do
    user = users(:two)

    assert_respond_to(user, :tasks)
    assert_equal user.tasks.length, 0
  end

  test "User can have multiple tasks" do
    user = users(:two)

    assert_respond_to(user, :tasks)
    assert_equal user.tasks.length, 0
  end

  test "Can crete a User from google" do
    google_hash = OmniAuth.config.mock_auth[:google]
    user = User.build_from_google(google_hash)

    assert user.valid?
  end
end
