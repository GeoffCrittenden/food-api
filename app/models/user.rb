require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_secure_password

  validates :username, presence: true,
                       format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :user_type, presence: true,
                        inclusion: { in: %w(customer restaurant_admin app_admin) }
  validates :organization_id, presence: true
  # validates :password, presence: true, length: { minimum: 8, maximum: 20 }, on: :create
  # validates :password_confirmation, presence: true, on: :create

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  has_many :items

end
