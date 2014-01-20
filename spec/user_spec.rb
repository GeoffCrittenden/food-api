require 'spec_helper'

describe User do
  before(:each) do
    @users = User.count
    @user = { username: 'person@email.com',
              first_name: 'John',
              last_name: 'Doe',
              user_type: 'customer',
              organization_id: 1,
              password: 'password',
              password_confirmation: 'password' }  
  end

  it "should open a new User" do
    user = User.new
    user.should be_a(User)
  end

  it "should create a new User" do
    user = User.create(@user)
    User.count.should eql(@users + 1)
  end

  it "requires a username" do
    @user.delete(:username)
    user = User.create(@user)
    User.count.should eql(@users)
  end

  it "requires the username to be an email address" do
    @user[:username] = 'username'
    user = User.create(@user)
    User.count.should eql(@users)
  end

  it "requires a user type" do
    @user.delete(:user_type)
    user = User.create(@user)
    User.count.should eql(@users)
  end

  it "requires the user type to be 'customer', 'restaurant', or 'app_admin'" do
    @user[:user_type] = 'costumer'
    user = User.create(@user)
    User.count.should eql(@users)
  end

  it "requires an organization id" do
    @user.delete(:organization_id)
    user = User.create(@user)
    User.count.should eql(@users)
  end

  it "requires a password length of at least 8 characters" do
    pending "troubleshooting bcrypt validations"
    @user[:password] = 'passwor'
    @user[:password_confirmation] = 'passwor'
    user = User.create(@user)
    User.count.should eql(@users)
  end

  it "requires a password confirmation" do
    @user.delete(:password_confirmation)
    user = User.create(@user)
    User.count.should eql(@users)
  end

  it "outputs a hash of restaurants User ordered from" do
    user = User.create(@user)
    user.restaurant_info.should be_a(Hash)
  end

  it "outputs a hash of items User has ordered" do
    user = User.create(@user)
    user.item_info.should be_a(Hash)
  end

end
