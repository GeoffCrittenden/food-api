class Organization < ActiveRecord::Base

  has_many :items
  has_many :users, through :items, as :customers

  validates :name, presence: true
  validates :org_type, presence: true, inclusion: { in: %w(restaurant customer application) }

end
