# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)
require "ruby_bbc/version"

Gem::Specification.new do |s|
  s.name        = "ruby_bbc"
  s.version     = RubyBBC::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rafael Fidelis"]
  s.email       = ["rafa_fidelis@yahoo.com.br"]
  s.homepage    = ""
  s.summary     = %q{Provides simple and fast conversion of BBCode to HTML}

  s.rubyforge_project = "ruby_bbc"

  s.files         = `git ls-files`.split("\n") # All files in git
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
  