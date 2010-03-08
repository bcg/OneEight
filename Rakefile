
require 'rubygems'
require 'rake/gempackagetask'
require 'rake/clean'
require 'rake/rdoctask'

require 'rake/gempackagetask'

NAME           = 'oneeight'
VERS           = '0.1'
GEM_NAME       = "#{NAME}-#{VERS}.gem"
TGZ_NAME       = "#{NAME}-#{VERS}.tgz"
RUBYFORGE_USER = ""
WWW            = ""

RDOC_MAIN = "README"

spec = Gem::Specification.new do |s|
  s.name             = NAME
  s.version          = VERS
  s.author           = "Brenden Grace"
  s.email            = "brenden.grace@gmail.com"
  s.platform         = Gem::Platform::RUBY
  s.summary          = "Some helper methods to utilize 1.8 functionality in 1.9"
  s.files            = %w{README LICENSE Rakefile} +
                       Dir.glob("ext/**/*.{h,c,rb}") +
                       Dir.glob("spec/**/*.rb")
  s.require_path     = "."
  s.autorequire      = "oneeight"
  s.extensions       = ["ext/extconf.rb"]
  #s.test_file        = ""
  s.has_rdoc         = true
  s.extra_rdoc_files = [ RDOC_MAIN, "LICENSE" ]
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

Rake::RDocTask.new(:rdoc) do |rd|
  rd.main = RDOC_MAIN
  rd.rdoc_files.include(RDOC_MAIN, "CHANGELOG", "LICENSE", "ext/**/*.c", "lib/**/*.rb")
  rd.options << "--all"
end

CLEAN.include FileList["ext/**/*.o",
                       "ext/**/*.so",
                       "ext/**/*.bundle",
                       "ext/**/Makefile",
                       "ext/**/mkmf.log",
                       "pkg/*", "pkg",
                      ]

desc 'Compile the module'
task :build do
  Dir.chdir('ext')
  sh('ruby extconf.rb')
  sh('make')
  Dir.chdir('..')
end

desc 'Run unit tests'
task :spec do
  Dir.chdir('specs')
  sh('bacon *_spec.rb')
  Dir.chdir('..')
end

desc 'Run unit tests'
task :test => [ :spec ]

task :gem do
  Dir.chdir('pkg')
  sh %{gem build ../oneeight.gemspec}
  Dir.chdir('..')
end

desc 'Build the gem and tarball'
task :package => [ :gem, :tgz ]

task :install => :gem do
  sh %{gem install pkg/#{GEM_NAME}}
end

task :uninstall do
  sh %{gem uninstall #{NAME}}
end

