
class LoginController < ApplicationController
  def login
    user = User.find_by(email: params["email"])&.authenticate(params["password"])
    if user.present?
      user.update!(client_token: User.create_client_token)
      return render json: { user: user.to_visible }
    end
    head :unauthorized
  end
end
