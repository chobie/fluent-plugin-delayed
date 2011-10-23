# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fluent/plugin/version"

Gem::Specification.new do |s|
  s.name        = "fluent-plugin-delayed"
  s.version     = Fluent::Plugin::Delayed::VERSION
  s.authors     = ["Shuhei Tanuma"]
  s.email       = ["chobieee@gmail.com"]
  s.homepage    = "http://github.com/chobie/fluent-plugin-delayed"
  s.summary     = %q{Delayed output plugin for Fluent event collector}
  s.description = %q{Delayed output plugin for Fluent event collector}

  s.rubyforge_project = "fluent-plugin-delayed"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
