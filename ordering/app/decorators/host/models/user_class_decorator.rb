# frozen_string_literal: true

unless (user_class = Ordering.user_class.safe_constantize).is_a?(Class)
  raise 'Ordering.user_class is not set correctly. Please set it to the name of your User class.'
end

user_class.class_eval do
  has_one :ordering_customer, class_name: 'Ordering::Customer', inverse_of: :user,
                              dependent: :destroy, foreign_key: :user_id
end
