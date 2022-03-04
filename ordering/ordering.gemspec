# frozen_string_literal: true

require_relative 'lib/ordering/version'

Gem::Specification.new do |spec|
  spec.name        = 'ordering'
  spec.version     = Ordering::VERSION
  spec.authors     = ['Minty Fresh']
  spec.email       = ['7896757+mintyfresh@users.noreply.github.com']
  spec.summary     = 'Ordering system for Rails store'
  spec.description = spec.summary

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'blueprinter'
  spec.add_dependency 'catalog'
  spec.add_dependency 'pundit'
  spec.add_dependency 'rails', '>= 7.0.2.2'

  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'rspec-rails'
end
