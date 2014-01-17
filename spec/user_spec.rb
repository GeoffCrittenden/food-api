require 'spec_helper'

describe User do

  before do
    @user = User.create(username: 'person@email.com',
                        first_name: 'This',
                        last_name: 'Guy',
                        user_type: 'customer',
                        organization_id: 1,
                        password: 'password',
                        password_confirmation: 'password')
  end

  it "should open a new User" do
    user = User.new
    user.should be_a(User)
  end

  it "should create a new User" do
    @user.should be_a(User)
  end

  it "requires a username" do
    users = User.count
    user = User.create(first_name: 'This',
                       last_name: 'Guy',
                       user_type: 'customer',
                       organization_id: 1,
                       password: 'password',
                       password_confirmation: 'password')
    User.count.should eql(users)
  end

  it "requires the username to be an email address" do
    users = User.count
    user = User.create(username: 'username',
                       first_name: 'This',
                       last_name: 'Guy',
                       user_type: 'customer',
                       organization_id: 1,
                       password: 'password',
                       password_confirmation: 'password')
    User.count.should eql(users)
  end

  it "requires a user type" do
    users = User.count
    user = User.create(username: 'person@email.com',
                       first_name: 'This',
                       last_name: 'Guy',
                       organization_id: 1,
                       password: 'password',
                       password_confirmation: 'password')
    User.count.should eql(users)
  end

  it "requires the user type to be 'customer', 'restaurant', or 'app_admin'" do
    users = User.count
    user = User.create(username: 'person@email.com',
                       first_name: 'This',
                       last_name: 'Guy',
                       user_type: 'costumer',
                       organization_id: 1,
                       password: 'password',
                       password_confirmation: 'password')
    User.count.should eql(users)
  end

  it "requires an organization id" do
    users = User.count
    user = User.create(username: 'person@email.com',
                       first_name: 'This',
                       last_name: 'Guy',
                       user_type: 'customer',
                       password: 'password',
                       password_confirmation: 'password')
    User.count.should eql(users)
  end

  it "requires a password confirmation" do
    users = User.count
    user = User.create(username: 'person@email.com',
                       first_name: 'This',
                       last_name: 'Guy',
                       user_type: 'customer',
                       organization_id: 1,
                       password: 'pass')
    User.count.should eql(users)
  end

end