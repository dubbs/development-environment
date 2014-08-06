class { 'apache':
	# prevent creating of default site
	default_vhost => false,
}

apache::vhost { 'localhost':
  port    => '80',
  docroot => '/vagrant/htdocs',
}