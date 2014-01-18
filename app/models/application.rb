require 'base64'

class Application < ActiveRecord::Base

  has_many :users
  has_many :admins, foreign_key: 'admin_id', class_name: 'User'

end
