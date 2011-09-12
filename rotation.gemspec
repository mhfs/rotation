# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rotation/version"

Gem::Specification.new do |s|
  s.name        = "rotation"
  s.version     = Rotation::VERSION
  s.authors     = ["Marcelo Silveira"]
  s.email       = ["marcelo@mhfs.com.br"]
  s.homepage    = "https://github.com/mhfs/rotation/"
  s.summary     = %q{Command line utility to help you control rotation of stuff over time}
  s.description = %q{Rotation is a quick utility to help you rotate any kind of stuff over time. I created it to control code review rotation among the team members.}

  s.rubyforge_project = "rotation"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_development_dependency "contest"
  s.add_development_dependency "redgreen"

  s.add_runtime_dependency "thor"
end
