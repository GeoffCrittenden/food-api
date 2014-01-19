class Item < ActiveRecord::Base

  belongs_to :restaurant, class_name: 'Organization'
  has_many :orders
  has_many :customers, through: :orders, class_name: 'User'

  validates :name, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 1 }
  validates :restaurant_id, presence: true

end
