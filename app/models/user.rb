require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :items
  has_secure_password

  validates :username, presence: true
  validates_format_of :username, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :user_type, presence: true
  validates :user_type, inclusion: { in: %w(customer restaurant_admin app_admin),
    message: "%{value} is not a valid user type" }
  validates :organization_id, presence: true
  validates :password_digest, presence: true
  validates :password_digest, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
