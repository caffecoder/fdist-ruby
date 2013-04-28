# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name            = 'file_distribution'
  s.version         = '0.1.0'
  s.summary         = "Simple file distribution library."
  s.description     = "Simple library that allows organize distribution of files within hex based tree."
  s.authors         = ["Adam Kubica"]
  s.email           = 'caffecoder@kaizen-step.com'
  s.homepage        = 'http://github.org/caffecoder/fdist-ruby'
  s.license         = 'MIT' 

  s.files           = Dir['Rakefile', 'LICENSE','{lib}/**/*']
  s.test_files      = Dir['test/**/*']

  s.required_ruby_version = '>= 1.8.7'
  
  s.add_development_dependency  'rake', '>= 10.0.0'
end
