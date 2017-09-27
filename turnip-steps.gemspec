# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "turnip/steps/version"

Gem::Specification.new do |spec|
  spec.name          = "turnip-steps"
  spec.version       = Turnip::Steps::VERSION
  spec.authors       = ["Stefan"]
  spec.email         = ["stefan.surzycki@gmail.com"]

  spec.summary       = %q{Some common steps for turnip}
  spec.description   = %q{Some common steps for turnip}
  spec.homepage      = 'https://github.com/surzycki/turnip-steps'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'capybara-email',      '~> 2.5' # Test your ActionMailer and Mailer messages with Capybara
  spec.add_dependency 'capybara-screenshot', '~> 1.0'
  spec.add_dependency 'byebug'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'
end
