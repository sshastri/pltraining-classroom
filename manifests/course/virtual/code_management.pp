class classroom::course::virtual::code_management (
  $session_id = $classroom::params::session_id,
  $role = $classroom::params::role,
) inherits classroom::params {

  include r10k::mcollective

  if $role == 'master' {

    include classroom::master::showoff

    class { 'puppetfactory':
      # Put students' puppetcode directories somewhere less distracting
      puppetcode => '/var/opt/puppetcode',
      session_id       => $session_id,
      privileged       => true,
    }

    class { 'r10k':
      remote => 'https://github.com/puppetlabs-education/classroom-control.git',
    }

  } else {
    include r10k
    puppet_enterprise::mcollective::client { 'peadmin':
      activemq_brokers => ['master.puppetlabs.vm'],
      keypair_name     => 'pe-internal-peadmin-mcollective-client',
      create_user      => true,
      logfile          => '/var/lib/peadmin/.mcollective.d/client.log',
      stomp_password   => pe_chomp(file('/etc/puppetlabs/mcollective/credentials','/dev/null')),
      stomp_port       => 61613,
      stomp_user       => 'mcollective',
    }
  }
}
