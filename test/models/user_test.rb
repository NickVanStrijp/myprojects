require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup 
    @user = User.new(user_first_name: "Example", user_last_name: "Example", user_nnumber: "n0238354", user_email: "user@example.com", 
    password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.user_first_name = "   "
    @user.user_last_name = "   "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.user_email= "   "
    assert_not @user.valid?
  end
  
  test "nnumber should be present" do
    @user.user_nnumber= "   "
    assert_not @user.valid?
  end
  
  test "first name should not be too long" do
    @user.user_first_name = "a" * 51
    assert_not @user.valid?
  end
  
  test "last name should not be too long" do
    @user.user_last_name = "a" * 51
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.user_email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  test "user nnumber should not be too long" do
    @user.user_nnumber = 9
    assert_not @user.valid?
  end
  
  test "validation should accept valid addresses" do
  valid_email = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                    first.last@foo.jp alice+bob@baz.cn]
  valid_email.each do |valid_email|
    @user.user_email = valid_email
    assert @user.valid?, " #{valid_email.inspect} should be valid"
    end 
  end
  
  test "email should reject invalid addresses" do
    invalid_email = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_email.each do |invalid_email|
      @user.user_email = invalid_email
      assert_not @user.valid?, "#{invalid_email.inspect} should be invalid"
    end 
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end 
  
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password should have minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  
  
end
