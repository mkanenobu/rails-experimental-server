require 'digest'

class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, on: :create
  validates :password_digest, presence: true, on: :create
  validates :client_token, uniqueness: true, allow_nil: true

  has_many :post

  before_create :set_client_token

  def authenticate(password:)
    self.password_digest === User.create_password_digest(password: password)
  end

  def password=(password)
    self.password_digest = User.create_password_digest(password: password)
  end


  def self.visible_attr
    select(:id, :email, :client_token)
  end

  def self.create_client_token
    SecureRandom.hex(32)
  end

  def self.create_password_digest(password:)
    # This is not production ready algorithm
    Digest::SHA256.hexdigest(password)
  end

  private

  def set_client_token
    self.client_token = User.create_client_token
  end
end
