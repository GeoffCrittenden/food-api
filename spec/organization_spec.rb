require 'spec_helper'

describe Organization do

  it "should open a new Organization" do
    org = Organization.new
    org.should be_a(Organization)
  end

  it "should create a new Organization" do
    orgs = Organization.count
    org = Organization.create(name: 'Company A', org_type: 'customer')
    Organization.count.should eql(orgs + 1)
  end

  it "requires an organization name" do
    orgs = Organization.count
    Organization.create(org_type: 'customer')
    Organization.count.should eql(orgs)
  end

  it "requires an organization type" do
    orgs = Organization.count
    Organization.create(name: 'Company B')
    Organization.count.should eql(orgs)
  end

  it "requires the organization type to be restaurant or customer" do
    orgs = Organization.count
    Organization.create(name: 'Goodburger', org_type: 'restarant')
    Organization.count.should eql(orgs)
  end

end