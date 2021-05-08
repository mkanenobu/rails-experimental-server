require 'digest'

class User < ApplicationRecord
  validates :email, presence: true, on: :create
  validates :password_digest, presence: true, on: :create
  validates :client_token, uniqueness: true

  has_many :post

  has_secure_password

  def self.visible_attr
    select(:id, :email, :client_token)
  end

  def self.create_client_token
    SecureRandom.hex(32)
  end
end
