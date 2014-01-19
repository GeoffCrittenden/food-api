require 'spec_helper'

describe User do

  it "should open a new User" do
    user = User.new
    user.should be_a(User)
  end

  it "should create a new User" do
    users = User.count
    user = User.create(username: 'person@email.com',
                       first_name: 'This',
                       last_name: 'Guy',
                       user_type: 'customer',
                       organization_id: 1,
                       password: 'password',
                       password_confirmation: 'password')
    User.count.should eql(users + 1)
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
    user = User.create(username: 'person1@email.com',
                       first_name: 'This',
                       last_name: 'Guy',
                       organization_id: 1,
                       password: 'password',
                       password_confirmation: 'password')
    User.count.should eql(users)
  end

  it "requires the user type to be 'customer', 'restaurant', or 'app_admin'" do
    users = User.count
    user = User.create(username: 'person2@email.com',
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
    user = User.create(username: 'person3@email.com',
                       first_name: 'This',
                       last_name: 'Guy',
                       user_type: 'customer',
                       password: 'password',
                       password_confirmation: 'password')
    User.count.should eql(users)
  end

  it "requires a password length of at least 8 characters" do
    pending "troubleshooting bcrypt validations"
    users = User.count
    user = User.create(username: 'person4@email.com',
                       first_name: 'This',
                       last_name: 'Guy',
                       user_type: 'customer',
                       organization_id: 1,
                       password: 'passwor',
                       password_confirmation: 'passwor')
    User.count.should eql(users)
  end

  it "requires a password confirmation" do
    users = User.count
    user = User.create(username: 'person5@email.com',
                       first_name: 'This',
                       last_name: 'Guy',
                       user_type: 'customer',
                       organization_id: 1,
                       password: 'password')
    User.count.should eql(users)
  end

  it "outputs a hash of restaurants User ordered from" do
    user = User.create(username: 'person6@email.com',
                       first_name: 'This',
                       last_name: 'Guy',
                       user_type: 'customer',
                       organization_id: 1,
                       password: 'password',
                       password_confirmation: 'password')
    user.restaurants.should be_a(Hash)
  end
end
