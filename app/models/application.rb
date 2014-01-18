require 'base64'

class Application < ActiveRecord::Base

  has_many :users
  has_many :admins, foreign_key: 'admin_id', class_name: 'User'

  after_initialize :create_auth_token

  validates :name, presence: true
  validates :admin_id, presence: true

  private

  def create_auth_token
    self.update_attributes(auth_token: Base64.encode64(self.name + User.find(self.admin_id).username).chop!)
  end

end
