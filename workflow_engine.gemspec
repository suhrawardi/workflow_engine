# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'workflow_engine/version'

Gem::Specification.new do |spec|
  spec.name          = 'workflow_engine'
  spec.version       = WorkflowEngine::VERSION
  spec.authors       = ['jarra']
  spec.email         = ['suhrawardi@gmail.com']
  spec.description   = 'A Workflow Engine'
  spec.summary       = 'A very lightweight and hopefully blazing fast Workflow Engine'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'treetop'
  spec.add_dependency 'active_support'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
