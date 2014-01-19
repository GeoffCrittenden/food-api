class Order < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant, class_name: 'Organization'
  has_many :items

  validates :user_id, presence: true
  validates :restaurant_id, presence: true

end
