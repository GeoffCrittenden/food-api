class Item < ActiveRecord::Base

  belongs_to :restaurant, class_name: 'Organization'
  has_many :customers, class_name: 'User'

end
