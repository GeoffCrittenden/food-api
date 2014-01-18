require 'spec_helper'

describe Organization do

  it "should open a new Organization" do
    org = Organization.new
    org.should be_a(Organization)
  end

  it "should create a new Organization" do
    pending
  end

  it "requires an organization name" do
    pending
  end

  it "requires an organization type" do
    pending
  end

  it "requires the organization type to be restaurant, customer, or application" do
    pending
  end

end