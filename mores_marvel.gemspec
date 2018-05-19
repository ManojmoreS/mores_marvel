
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mores_marvel/version"

Gem::Specification.new do |spec|
  spec.name          = "mores_marvel"
  spec.version       = MoresMarvel::VERSION
  spec.authors       = ["Manoj more"]
  spec.email         = ["lettertomanojmore@gmail.com"]

  spec.summary       = %q{Ruby gem for Marvel API}
  spec.description   = %q{Use this to play arround with Marvel resources}
  spec.homepage      = "https://github.com/ManojmoreS/mores_marvel"
  spec.license       = "MIT"

  spec.files         = Dir['{app,config,lib}/**/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
