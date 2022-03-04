# frozen_string_literal: true

class ApplicationController < ActionController::API
  # @return [MockUser]
  def current_user
    @current_user ||= MockUser.last || FactoryBot.create(:mock_user)
  end
end
