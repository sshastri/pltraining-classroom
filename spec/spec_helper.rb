require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  # Adds to the built in defaults from rspec-puppet
  c.default_facts = {
    :ipaddress                 => '127.0.0.1',
    :kernel                    => 'Linux',
    :operatingsystem           => 'CentOS',
    :operatingsystemmajrelease => '7',
    :osfamily                  => 'RedHat',
    :path                      => '/opt/puppetlabs/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin',
    :pe_concat_basedir         => '/opt/puppetlabs/puppet/cache/pe_concat',
  }
end

puts
puts '******************************************************'
puts
puts 'This will currently fail due to an rspec-puppet bug:'
puts 'https://github.com/rodjek/rspec-puppet/issues/322'
puts
puts '******************************************************'
