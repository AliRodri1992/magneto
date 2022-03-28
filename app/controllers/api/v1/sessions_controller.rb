class Api::V1::SessionsController < ApplicationController
  def login
    user = User.find_by(email: login_params[:email])
    if user.present? && user.authenticate(login_params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: user, params: { auth_token: token },
             status: :ok, code: '200'
    else
      render json: [{ title: 'Invalid Email or Password' }],
             code: '401', status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
