class Organization < ActiveRecord::Base

  has_many :items
  has_many :users, through :items, as :customers
  has_many :users, foreign_key :admin_id, as :admins

  validates :name, presence: true
  validates :org_type, presence: true, inclusion: { in: %w(restaurant customer) }

end
