require 'spec_helper'

describe Order do
  before do
    @org = Organization.create(name: 'Irazu', org_type: 'restaurant')
    @user = User.create(username: 'sandwichboy@email.com',
                        user_type: 'customer',
                        organization_id: 1,
                        password: 'password',
                        password_confirmation: 'password')
    @items = Item.create([ { name: 'Pepito Sandwich', description: 'Our best sandwich.', restaurant_id: Organization.find_by(name: 'Irazu').id },
                           { name: 'Chicken Sandwich', description: 'Tasty chicken sandwich.', restaurant_id: Organization.find_by(name: 'Irazu').id },
                           { name: 'Plaintains', description: 'Fried plaintains. Yum.', restaurant_id: Organization.find_by(name: 'Irazu').id } ])
    @order = Order.create(restaurant_id: Organization.find_by(name: 'Irazu').id, user_id: User.find_by(username: 'sandwichboy@email.com').id)
    @items.each { |item| @order.items << item }
  end

  before(:each) do
    @orders = Order.count
  end

  it "opens a new Order" do
    order = Order.new
    order.should be_a (Order)
  end

  it "creates a new Order" do
    @order.should be_a(Order)
  end

  it "requires a user id" do
    Order.create(restaurant_id: @org.id)
    Order.count.should eql(@orders)
  end

  it "requires a restaurant id" do
    Order.create(user_id: @user.id)
    Order.count.should eql(@orders)
  end

  it "accepts items" do
    @order.items.count.should eql(3)
  end

end
