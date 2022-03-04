# frozen_string_literal: true

require_relative 'lib/catalog/version'

Gem::Specification.new do |spec|
  spec.name        = 'catalog'
  spec.version     = Catalog::VERSION
  spec.authors     = ['Minty Fresh']
  spec.email       = ['7896757+mintyfresh@users.noreply.github.com']
  spec.summary     = 'Store catalog for vendors and products'
  spec.description = spec.summary
  spec.license     = 'MIT'

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'blueprinter'
  spec.add_dependency 'kaminari-activerecord'
  spec.add_dependency 'money-rails'
  spec.add_dependency 'pundit'
  spec.add_dependency 'rails', '>= 7.0.2.2'

  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'rspec-rails'
end
