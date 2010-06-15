
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

Rake::RDocTask.new(:rdoc) do |rd|
  rd.main = RDOC_MAIN
  rd.rdoc_files.include(RDOC_MAIN, "CHANGELOG", "LICENSE", "ext/**/*.c", "lib/**/*.rb")
  rd.options << "--all"
end

CLEAN.include FileList["ext/**/*.o",
                       "ext/**/*.so",
                       "ext/**/*.bundle",
                       "ext/**/Makefile",
                       "ext/**/mkmf.log"
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
  sh %{gem build oneeight.gemspec}
end

desc 'Build the gem and tarball'
task :package => [ :gem, :tgz ]

task :install => :gem do
  sh %{gem install #{GEM_NAME}}
end

task :uninstall do
  sh %{gem uninstall #{NAME}}
end

