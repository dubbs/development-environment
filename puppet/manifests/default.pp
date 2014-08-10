# like `include apache` but allows configuration
class { 'apache':
	# do not want default vhost to hijack requests, create another
  default_vhost        => false,
}

apache::vhost { 'default-dev':
  port    => '80',
  docroot => '/vagrant/public_html',
  logroot => '/vagrant/logs',
}
