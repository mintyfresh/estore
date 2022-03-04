# frozen_string_literal: true

class ApplicationController < ActionController::API
  # @return [User]
  def current_user
    @current_user ||= User.last # TODO
  end

  def catalog_owner
    current_user
  end
end
