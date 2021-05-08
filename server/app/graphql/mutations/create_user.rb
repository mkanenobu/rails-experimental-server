module Mutations
  class CreateUser < BaseMutation
    graphql_name 'CreateUser'

    field :user, Types::UserType, null: true
    field :result, Boolean, null: true

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(**args)
      user = User.new(email: args[:email])
      user.password = args[:password]
      result = user.save

      {
        user: user,
        result: result,
      }
    end
  end
end
