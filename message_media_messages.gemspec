Gem::Specification.new do |s|
  s.name = 'messages-ruby-sdk'
  s.version = '3.0.0'
  s.summary = 'MessageMedia Messages SDK'
  s.description = 'The MessageMedia Messages API provides a number of endpoints for building powerful two-way messaging applications.'
  s.authors = ['MessageMedia Developers']
  s.email = 'developers@messagemedia.com'
  s.homepage = 'https://developers.messagemedia.com'
  s.license = 'Apache-2.0'
  s.add_dependency('logging', '~> 2.0')
  s.add_dependency('faraday', '>= 0.10', '<= 2.0')
  s.add_dependency('test-unit', '~> 3.1.5')
  s.add_dependency('certifi', '~> 2016.9', '>= 2016.09.26')
  s.add_dependency('faraday-http-cache', '~> 2.4.1')
  s.required_ruby_version = '>= 2.0.0'
  s.files = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  s.require_paths = ['lib']
end
