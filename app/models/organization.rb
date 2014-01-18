class Organization < ActiveRecord::Base

  has_many :items
  has_many :customers, through: :items, class_name: 'User'
  has_many :admins, foreign_key: 'admin_id', class_name: 'User'

  validates :name, presence: true
  validates :org_type, presence: true, inclusion: { in: %w(restaurant customer) }

end
