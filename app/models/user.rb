class User < ActiveRecord::Base

  validates :username, presence: true
  validates :type, presence: true
  validates :organization_id, presence: true
  validates :password_digest, presence: true

end
