# frozen_string_literal: true

require 'catalog'
require 'decorators'
require 'pundit'

begin
  require 'factory_bot_rails'
rescue LoadError
  # Nothing to do.
end

module Ordering
  class Engine < ::Rails::Engine
    isolate_namespace Ordering

    config.generators.api_only = true

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    if config.respond_to?(:factory_bot)
      config.factory_bot.definition_file_paths << File.expand_path('../../spec/factories', __dir__)
    end

    initializer 'ordering.load_decorators' do
      Decorators.register!(Engine.root)
    end
  end
end
