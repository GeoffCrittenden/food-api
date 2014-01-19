class Order < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant, class_name: 'Organization'
  has_many :items

end
