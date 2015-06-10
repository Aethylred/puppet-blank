require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'
include RspecPuppetFacts

RSpec.configure do |c|

  c.treat_symbols_as_metadata_keys_with_true_values = true

  c.before :each do
    # Ensure that we don't accidentally cache facts and environment
    # between test cases.
    Facter::Util::Loader.any_instance.stubs(:load_all)
    Facter.clear
    Facter.clear_messages

    # Store any environment variables away to be restored later
    @old_env = {}
    ENV.each_key {|k| @old_env[k] = ENV[k]}

    if ENV['STRICT_VARIABLES'] == 'yes'
      Puppet.settings[:strict_variables]=true
    end
  end
end

shared_examples :compile, :compile => true do
  it { should compile.with_all_deps }
end

$supported_os = on_supported_os.map do |os, facts|
  os_expects = {}
  expects = {

  }
  case facts[:osfamily]
  when 'Debian'
    expects.merge!( {

    } )
  when 'RedHat'
    expects.merge!( {

    } )
  end

  os_expects = {
    :os      => os,
    :facts   => facts,
    :expects => expects
  }
  os_expects
end
