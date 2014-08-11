# import 'apt.pp'
# import 'php.pp'
# import 'apache.pp'
# import 'mysql.pp'

class { 'apt':
  always_apt_update => true,
}

# like `include apache` but allows configuration
class { 'apache':
  # do not want default vhost to hijack requests, create another
  default_vhost => false,
  # instead of `worker`, required for mod_php
  # mpm_module    => 'prefork',
}

apache::mod { 'suphp': }

apache::vhost { 'default-dev':
  port              => '80',
  docroot           => '/vagrant/public_html',
  logroot           => '/vagrant/logs',
  suphp_addhandler  => 'x-httpd-php',
  suphp_engine      => 'on',
  suphp_configpath  => '/etc/php5/apache2',
}


# # set docroot for suphp
file { '/etc/suphp/suphp.conf':
  ensure => present
}
file_line { 'update_docroot':
	path    => '/etc/suphp/suphp.conf',
	match   => '^docroot=',
	line    => 'docroot=/vagrant/public_html',
}


class { 'php':
}

# # runs apt-get php5-?
php::module { 'mysql': }



class { 'mysql::server':
  root_password    => '384E92C9A0E53EB80C7DB5612EE8E99717309C5F',
  override_options => { 'mysqld' => { 'max_connections' => '1024' } },
}

mysql::db { 'mydb':
  user     => 'vagrant',
  password => 'password',
  host     => 'localhost',
  grant    => ['ALL'],
}


