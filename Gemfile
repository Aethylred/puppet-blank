source 'https://rubygems.org'

group :development, :test do
  gem 'rake',                   :require => false
  gem 'rspec-puppet',           :require => false
  gem 'puppetlabs_spec_helper', :require => false
  gem 'ruby-augeas',            :require => false
  gem 'rspec-puppet-augeas',    :require => false
  gem 'rspec-system',           :require => false
  gem 'rspec-system-puppet',    :require => false
  gem 'puppet-lint',            :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion,  :require => false
else
  gem 'puppet',                 :require => false
end

# vim:ft=ruby