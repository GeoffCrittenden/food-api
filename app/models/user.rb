require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :items
  has_secure_password

  validates :username, presence: true,
                       format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                       message: 'must be a valid email address' }
  validates :user_type, presence: true,
                        inclusion: { in: %w(customer restaurant_admin app_admin),
                        message: "%{value} is not a valid user type" }
  validates :organization_id, presence: true
  validates :password, length: { in: 8..20 }
  validates :password_confirmation, presence: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
