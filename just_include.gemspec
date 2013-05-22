# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "just_include/version"

Gem::Specification.new do |s|
  s.name        = "just_include"
  s.version     = JustInclude::VERSION
  s.authors     = ["kubenstein"]
  s.email       = ["kubenstein@gmail.com"]
  s.homepage    = "https://github.com/kubenstein/just_include"
  s.summary     = %q{Simplify including functionality from module to class}
  s.description = %q{With JustInclude you can include all kind of things from module to class, such as: methods, class methods, callbacks, relation definitions, act_as_*, constans, extends/includes, etc...}

  s.rubyforge_project = "just_include"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end