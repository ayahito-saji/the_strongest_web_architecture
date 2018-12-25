# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SHELL
set -i

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc

nvm install --lts
nvm alias default lts/*

sudo apt-get -y install git curl g++ make
sudo apt-get -y install zlib1g-dev libssl-dev libreadline-dev
sudo apt-get -y install libyaml-dev libxml2-dev libxslt-dev
sudo apt-get -y install sqlite3 libsqlite3-dev

git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

rbenv install 2.4.0
rbenv rehash
rbenv global 2.4.0

gem update --system
gem install bundler
gem install rails --version='5.1.4'
gem install sqlite3

npm install -g vue-cli

SHELL

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provision "shell", privileged: false, inline: $script
end
