# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paypal_express_checkout/version'

Gem::Specification.new do |spec|
  spec.name          = "paypal_express_checkout"
  spec.version       = PaypalExpressCheckout::VERSION
  spec.authors       = ["Ivan Velasquez"]
  spec.email         = ["ivan.velasquez.rios@gmail.com"]

  spec.summary       = %q{Paypal express checkout gem}
  spec.description   = %q{Simple hanlder for Paypal express checkout}
  spec.homepage      = "https://github.com/chukitow/paypal-express-checkout"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency             "activesupport", ">= 4.0.1"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
