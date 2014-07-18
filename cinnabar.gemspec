$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cinnabar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cinnabar"
  s.version     = Cinnabar::VERSION
  s.authors     = ["Chris Dahms"]
  s.email       = ["zentrification@gmail.com"]
  #s.homepage    = "TODO"
  s.summary     = "Rails backend for mercury."
  s.description = "Rails backend for mercury."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.14"
  s.add_dependency "mercury-rails", "~> 0.9.0"

  s.add_development_dependency "sqlite3"
end
