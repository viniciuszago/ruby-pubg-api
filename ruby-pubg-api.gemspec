# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "pubg/version"

Gem::Specification.new do |spec|
  spec.name          = "pubg-api"
  spec.version       = Pubg::VERSION
  spec.authors       = ["Vinicius Zago"]
  spec.email         = ["mvinicius.zago@gmail.com"]

  spec.summary       = "A Ruby wrapper for https://pubgtracker.com/site-api"
  spec.description   = ""
  spec.homepage      = "https://github.com/viniciuszago/ruby-pubg-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.3"
  spec.add_development_dependency "pry"
end
