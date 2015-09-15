  require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "myProjects"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | myProjects"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | myProjects"
  end
  
  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | myProjects"
  end
end
