require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-augeas'
RSpec.configure do |c|
  c.augeas_fixtures = File.join(File.dirname(File.expand_path(__FILE__)), 'fixtures', 'augeas')
  c.before :each do
    if ENV['STRICT_VARIABLES'] == 'yes'
        Puppet.settings[:strict_variables]=true
    end
  end
end