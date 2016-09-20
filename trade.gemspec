# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trade/version'

Gem::Specification.new do |spec|
  spec.name          = "trade"
  spec.version       = Trade::VERSION
  spec.authors       = ["Rafael Laurindo"]
  spec.email         = ["rafaelplaurindo@gmail.com"]

  spec.summary       = %q{Sumary}
  spec.description   = %q{Provides a way to convert values between the units of mass and volume used in commercial trades.}
  spec.homepage      = "https://rubygems.org/gems/trade"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.test_files     = Dir["test/**/*"]

  # spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.files          = Dir["{bin,lib,vendor}/**/*", "CODE_OF_CONDUCT.md", "MIT-LICENSE", "LICENSE.txt" "README.md", "Rakefile"]

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.require_paths = %w{bin lib vendor}

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "measurement_units", "~> 0.0"
end
