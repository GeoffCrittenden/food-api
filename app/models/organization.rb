class Organization < ActiveRecord::Base

  has_many :items, foreign_key: 'restaurant_id'
  has_many :orders
  has_many :customers, through: :orders, class_name: 'User'

  validates :name, presence: true
  validates :org_type, presence: true, inclusion: { in: %w(restaurant customer application) }

end
