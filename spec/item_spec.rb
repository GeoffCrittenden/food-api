require 'spec_helper'

describe Item do
  before (:each) do
    @items = Item.count
    @item = { name: 'Chicken Burrito',
              description: 'Burrito made with chicken.',
              restaurant_id: 1 }
  end
  
  it "opens a new Item" do
    item = Item.new
    item.should be_a(Item)
  end

  it "creates a new Item" do
    Item.create(@item)
    Item.count.should eql(@items + 1)
  end

  it "requires a name" do
    Item.create(description: @item[:description], restaurant_id: @item[:restaurant_id])
    Item.count.should eql(@items)
  end

  it "requires a description" do
    Item.create(name: @item[:name], restaurant_id: @item[:restaurant_id])
    Item.count.should eql(@items)
  end

  it "requires a restaurant id" do
    Item.create(name: @item[:name], description: @item[:description])
    Item.count.should eql(@items)
  end

end