class Organization < ActiveRecord::Base

  has_many :users
  has_many :items

  validates :name, presence: true
  validates :org_type, presence: true, inclusion: { in: %w(restaurant customer application) }

end
