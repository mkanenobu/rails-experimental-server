module Mutations
  class CreatePost < BaseMutation
    graphql_name 'CreatePost'

    field :post, Types::PostType, null: true
    field :result, Boolean, null: true

    argument :user_id, ID, required: true
    argument :title, String, required: true
    argument :text, String, required: true
    argument :published, String, required: false

    def resolve(**args)
      post = Post.create(
        title: args[:title], text: args[:text],
        published: args[:published], user_id: args[:user_id]
      )
      {
        post: post,
        result: post.errors.blank?
      }
    end
  end
end
