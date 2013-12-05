$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hopskip/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hopskip"
  s.version     = Hopskip::VERSION
  s.authors     = ["Max Woolf"]
  s.email       = ["max.woolf@boxuk.com"]
  s.homepage    = "http://boxuk.com"
  s.summary     = "Hopscotch introductions written more cleanly in YAML"
  s.description = "Write your hopscotch introductions using YAML."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "sqlite3"
end
