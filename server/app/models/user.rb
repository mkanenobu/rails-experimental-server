require 'digest'

class User < ApplicationRecord
  validates :email, presence: true, on: :create
  validates :password_digest, presence: true, on: :create
  validates :client_token, uniqueness: true

  has_secure_password

  def to_visible
    {
      id: id,
      email: email,
      token: client_token
    }
  end

  def self.create_client_token
    SecureRandom.hex(32)
  end
end
