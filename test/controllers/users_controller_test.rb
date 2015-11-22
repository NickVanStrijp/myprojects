require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.new(user_first_name: "Example", user_last_name: "Example", user_nnumber: "n0238354", user_email: "user@example.com", 
    password: "foobar", password_confirmation: "foobar")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { user_email: @user.user_email, user_first_name: @user.user_first_name, user_last_name: @user.user_last_name, user_nnumber: @user.user_nnumber }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { user_email: @user.user_email, user_first_name: @user.user_first_name, user_last_name: @user.user_last_name, user_nnumber: @user.user_nnumber }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
