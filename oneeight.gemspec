# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name    = 'oneeight'
  s.version = '0.1'

  s.authors = ['Brenden Grace']
  s.date    = '2010-03-08'

  s.description = 'A Ruby 1.8 backwards compatibility C module for 1.9'

  s.files      = Dir['ext/**/*']
  s.test_files = Dir['spec/**/*']

  s.rdoc_options  = ["--charset=UTF-8"]

  s.require_paths = ["ext"]
  s.rubygems_version = '1.3.5'
  s.summary = 'A Ruby 1.8 backwards compatibility C module for 1.9'
end

