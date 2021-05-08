class UsersController < AppNeedsAuthController
  def index
    render json: { users: User.visible_attr.all }
  end

  def create
    User.create(
      email: params["email"],
      password: params["password"],
      client_token: User.create_client_token
    )
  end
end
