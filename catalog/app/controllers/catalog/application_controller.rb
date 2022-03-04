# frozen_string_literal: true

module Catalog
  class ApplicationController < Catalog.controller_class.safe_constantize
    include Pundit

    def pundit_user
      catalog_owner
    end
  end
end
