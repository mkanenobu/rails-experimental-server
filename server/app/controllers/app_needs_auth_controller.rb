class AppNeedsAuthController < ApplicationController
  before_action :require_login

  private

  def require_login
    @login_user = User.find_by(client_token: request.headers["token"])
    head :unauthorized unless @login_user.present?
  end
end
