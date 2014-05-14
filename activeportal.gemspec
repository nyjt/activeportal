$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'active_portal/version'

Gem::Specification.new do |s|
  s.name        = 'activeportal'
  s.version     = ActivePortal::VERSION
  s.authors     = ['Jozsef Nyitrai']
  s.email       = ['nyitrai.jozsef@gmail.com']
  s.homepage    = 'http://github.com/nyjt/activeportal'
  s.summary     = 'Ruby on Rails portal gem'
  s.description = 'This gem make easier to building modern web 2.0 portals using Ruby on Rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.1.0'
  s.add_dependency 'devise', '~> 3.2.4'

  s.add_development_dependency 'pg'
  s.add_development_dependency 'rspec', '~> 3.0.0.beta'
  s.add_development_dependency 'rspec-rails', '~> 3.0.0.beta'
end
