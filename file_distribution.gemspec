# -*- encoding: utf-8 -*-
# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name            = 'file_distribution'
  s.version         = '0.2.2'
  s.summary         = 'Simple file distribution library.'
  s.description     = 'Simple library that allows organize distribution of files within hex based tree.'
  s.authors         = ['Adam Kubica']
  s.email           = 'xcdr@kaizen-step.com'
  s.homepage        = 'https://github.com/xcdr/fdist-ruby'
  s.license         = 'MIT'

  s.files           = Dir['Rakefile', 'LICENSE', '{lib}/**/*']
  s.test_files      = Dir['test/**/*']
  s.rdoc_options    = ['--charset=UTF-8']

  s.required_ruby_version = '>= 2.2.1'

  s.add_development_dependency 'rake', '~> 10.0', '>= 10.0.0'
end
