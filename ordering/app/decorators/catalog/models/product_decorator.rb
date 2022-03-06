# frozen_string_literal: true

Catalog::Product.class_eval do
  has_many :cart_items, class_name: 'Ordering::CartItem', inverse_of: :product, dependent: :restrict_with_error
end
