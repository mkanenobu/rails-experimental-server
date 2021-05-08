module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :client_token, String, null: true
    field :posts, [Types::PostType], null: false
    def posts
      object.post
    end
  end
end
