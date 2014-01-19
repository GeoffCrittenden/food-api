require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_secure_password
  has_many   :orders
  has_many   :items, through: :orders
  belongs_to :organization
  has_many   :applications

  validates :username, presence: true,
                       format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :user_type, presence: true,
                        inclusion: { in: %w(customer restaurant_admin app_admin) }
  validates :organization_id, presence: true
  # validates :password, presence: true, length: { minimum: 8, maximum: 20 }, on: :create
  # validates :password_confirmation, presence: true, on: :create

  def restaurants
    output = { restaurants: [] }
    self.orders.each { |order| output[:restaurants] << order.restaurant.name }
    output
  end

  def items
    output = { items: [] }
    self.orders.each { |order|
      order.items.each { |item|
        output[:items] << { name: item.name, description: item.description, restaurant: item.restaurant.name }
      }
    }
    output
  end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
