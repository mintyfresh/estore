# frozen_string_literal: true

class ApplicationController < ActionController::API
  # @return [MockUser]
  def current_user
    @current_user ||= MockUser.last
  end

  def catalog_owner
    current_user
  end
end
