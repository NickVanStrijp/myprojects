require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "invalid user data" do
    get signup_path
    assert_no_different 'User.count' do
      post user_path, user: { user_first_name: "",
                              user_last_name: "",
                              user_email: "user@invalid",
                              user_nnumber: "b00",
                              password: "foo",
                              password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post_via_redirect users_path, user: { user_first_name: "User",
                                            user_last_name: "LastName",
                                            user_email: "user@email.com",
                                            user_nnumber: "n0293847",
                                            password: "password",
                                            password_confirmation: "password" }
  end
  assert_template 'users/show'
  assert is_logged_in? 
end
end
