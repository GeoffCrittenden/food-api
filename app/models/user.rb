require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_secure_password

  validates :username, presence: true
  validates :type, presence: true
  validates :organization_id, presence: true
  validates :password_digest, presence: true
  validates :password_confirmation, presence: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
