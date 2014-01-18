require 'base64'

class Application < ActiveRecord::Base

  has_many :users
  has_many :admins, foreign_key: 'admin_id', class_name: 'User'

  validates :name, presence: true, length: { minimum: 1 }
  validates :admin_id, presence: true

  after_initialize :create_auth_token

  private

  def create_auth_token
    name = self.name ? self.name : 'name'
    admin = self.admin_id ? User.find(self.admin_id).username : 'username'
    self.update_attributes(auth_token: Base64.encode64(name + admin).chop!)
  end

end
