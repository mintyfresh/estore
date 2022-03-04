# frozen_string_literal: true

module Ordering
  class ApplicationController < Ordering.controller_base_class.safe_constantize
    include Pundit

    # @return [Customer, nil]
    def current_customer
      return if current_user.nil?

      @current_customer ||= Customer.find_or_create_by!(user: current_user)
    rescue ActiveRecord::RecordNotUnique
      @current_customer = Customer.find_by!(user: current_user)
    end

    # @return [Cart, nil]
    def current_cart
      @current_cart ||= current_customer && Cart.create_or_find_by!(customer: current_customer)
    end
  end
end
