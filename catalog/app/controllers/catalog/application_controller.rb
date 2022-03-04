# frozen_string_literal: true

module Catalog
  class ApplicationController < Catalog.controller_class.safe_constantize
    include Pundit

    def pundit_user
      catalog_owner
    end

  private

    def render_as_json(object, blueprint: blueprint_for(object), owner: catalog_owner, **options)
      blueprint.render_as_json(object, owner: owner, **options)
    end

    def blueprint_for(object)
      case object
      when ActiveRecord::Relation
        "#{object.klass.name}Blueprint".safe_constantize
      else
        "#{object.class.name}Blueprint".safe_constantize
      end
    end
  end
end
