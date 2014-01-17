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
    User.count.should be(users)
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
    User.count.should be(users)
  end
  
end