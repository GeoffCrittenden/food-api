require 'base64'

class Application < ActiveRecord::Base

  has_many :users
  has_many :admins, foreign_key: 'admin_id', class_name: 'User'

  after_initialize :create_auth_token

  private

  def create_auth_token
    if self.auth_token == nil
      self.update_attributes(auth_token: Base64.encode64(self.name + User.find(self.admin_id).username).chop!)
    else
      puts 'This application already has an auth_token.'
    end
  end

end
