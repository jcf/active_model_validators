# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_model_validators/version"

Gem::Specification.new do |s|
  s.name        = "active_model_validators"
  s.version     = ActiveModelValidators::VERSION
  s.authors     = ["James Conroy-Finn"]
  s.email       = ["james@logi.cl"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "active_model_validators"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'activemodel'

  # TODO Modularize the validators
  # NOTE Used by the EmailValidator
  s.add_runtime_dependency 'mail'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'shoulda-matchers'
end
