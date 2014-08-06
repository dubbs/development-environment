class { 'apt':
  always_apt_update    => true
}

class { 'apache':
	# prevent creating of default site
	default_vhost => false,
	require => Class['apt']
}

apache::vhost { 'localhost':
  port    => '80',
  docroot => '/vagrant/htdocs',
}

class { 'php':
	require => Class['apache']
}