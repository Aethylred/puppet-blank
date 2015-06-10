source 'https://rubygems.org'

gem 'metadata-json-lint'
gem 'rspec-puppet-facts'
gem 'puppetlabs_spec_helper', '>= 0.1.0'
gem 'puppet-lint',            '>= 1.0.0'

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion
else
  gem 'puppet'
end

# rspec must be v2 for ruby 1.8.7
if RUBY_VERSION >= '1.8.7' and RUBY_VERSION < '1.9'
  gem 'rspec', '~> 2.0'
end

# vim:ft=ruby
