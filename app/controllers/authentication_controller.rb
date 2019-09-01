class AuthenticationController < ApplicationController
  # return auth token once user is authenticated
  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token, user: user)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end

  def user
    User.find_by(email: auth_params[:email])
  end
end
