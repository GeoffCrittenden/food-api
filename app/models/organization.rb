class Organization < ActiveRecord::Base

  has_many :items, foreign_key: 'restaurant_id'
  has_many :customers, through: :items, class_name: 'User'
  has_many :admins, foreign_key: 'id', class_name: 'User'

  validates :name, presence: true
  validates :org_type, presence: true, inclusion: { in: %w(restaurant customer application) }

end
