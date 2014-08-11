
class { 'apt':
  # run apt-get update
  always_apt_update => true
}

# like `include apache` but allows configuration
class { 'apache':
  # do not want default vhost to hijack requests, create another
  default_vhost => false,
  # instead of `worker`, required for mod_php
  mpm_module    => 'prefork',
  # after apt
  require       => Class['apt']
}

apache::vhost { 'default-dev':
  port              => '80',
  docroot           => '/vagrant/public_html',
  logroot           => '/vagrant/logs',
}

include apache::mod::php