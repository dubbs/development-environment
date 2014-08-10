class { 'apt':
  always_apt_update    => true
}

class { 'apache':
	# prevent creating of default site, so docroot can be set
	default_vhost => false,
	require => Class['apt']
}

apache::vhost { 'localhost':
  port    => '80',
  docroot => '/vagrant/public',
}

class { 'php':
	require => Class['apache']
}