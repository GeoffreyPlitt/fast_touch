Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.provision :shell, :inline => $BOOTSTRAP_SCRIPT # see below
  config.vm.network :forwarded_port, host: 8081, guest: 8080
end

$BOOTSTRAP_SCRIPT = <<EOF
	set -e # Stop on any error

	# --------------- SETTINGS ----------------
	# Other settings
	export DEBIAN_FRONTEND=noninteractive

	# --------------- APT-GET REPOS ----------------
	# Install prereqs
	sudo apt-get update
	sudo apt-get install -y python-software-properties build-essential gcc g++
	sudo add-apt-repository ppa:chris-lea/node.js
	sudo apt-get update
	sudo apt-get install -y python-lxml libxml2-dev libxslt-dev libmysqlclient-dev libpq-dev libevent-dev python-dev python-pip
	sudo apt-get install -y mongodb coffeescript nodejs jade curl

	# ------------------ PYTHON -------------------
	sudo pip install -U 'distribute>=0.6.28' # allows python to install things we need.

	# --- local tunnel stuff
	gem install forward


	# last step is manual. once vagrant is up, run the server, and then:
	# forward 8080
EOF
