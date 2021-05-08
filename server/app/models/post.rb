class Post < ApplicationRecord
  belongs_to :user

  scope :available, -> { where(published: true) }
end
