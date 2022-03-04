# frozen_string_literal: true

class AuthController < ApplicationController
  def sign_in
    email, password = params.require(:sign_in).permit(:email, :password).values_at(:email, :password)

    user    = User.find_by(email: email)&.authenticate(password).presence
    session = user && Session.create!(user: user)

    if session
      render json: { token: session.token }
    else
      render json: { errors: { base: ['Invalid email or password'] } }, status: :unauthorized
    end
  end

  def sign_out
    if current_session.nil? || current_session.revoke!
      head :ok
    else
      render json: current_session.errors, status: :unprocessable_entity
    end
  end
end
