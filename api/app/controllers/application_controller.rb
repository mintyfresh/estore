# frozen_string_literal: true

class ApplicationController < ActionController::API
  # @return [User, nil]
  def current_user
    current_session&.user
  end

  # @return [Session, nil]
  def current_session
    return @current_session if defined?(@current_session)

    @current_session = Session.find_by_token(session_token)
  end

  # @return [String, nil]
  def session_token
    type, token = request.headers['Authorization']&.split(' ')

    token if type == 'Bearer'
  end
end
