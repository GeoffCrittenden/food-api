require 'base64'

class Application < ActiveRecord::Base

  has_many :users
  has_many :admins, foreign_key: 'admin_id', class_name: 'User'

  def create_auth_token
    @auth_token = Base64.encode64(self.name)    
  end

end
