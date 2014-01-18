require 'spec_helper'

describe Application do
  before do
    @org  = Organization.create(name: 'FoodApp', org_type: 'application')
    @user = User.create(username: 'admin@foodapp.com',
                        user_type: 'app_admin',
                        organization_id: Organization.find_by(name: 'FoodApp').id,
                        password: 'password',
                        password_confirmation: 'password')
  end

  it "opens a new Application" do
    app = Application.new(name: @org.name, admin_id: @user.id)
    app.should be_a(Application)
  end

  it "creates a new Application" do
    apps = Application.count
    app = Application.create(name: @org.name, admin_id: User.find_by(username: 'admin@foodapp.com').id)
    Application.count.should eql(apps + 1)
  end

  it "requires a name" do
    apps = Application.count
    app = Application.create(admin_id: User.find_by(username: 'admin@foodapp.com').id)
    Application.count.should eql(apps)
  end

  it "requires an admin_id" do
    apps = Application.count
    app = Application.create(name: @org.name)
    Application.count.should eql(apps)
  end

  it "adds an auth_token after initialize" do
    app = Application.create(name: @org.name, admin_id: User.find_by(username: 'admin@foodapp.com').id)
    app.auth_token.should_not be nil
  end

end