
download box and update vagrant file

	vagrant init
	vagrant box add hashicorp/precise64

install modules

	# install deps from gemfile
	bundle install

	# install deps from puppet file
	librarian-puppet install --path puppet/modules

reprovision

	vagrant reload --provision
