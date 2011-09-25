apt-get install ruby build-essential libopenssl-ruby ruby1.8-dev
curl -o /opt/rubygems-1.8.10.tgz http://production.cf.rubygems.org/rubygems/rubygems-1.8.10.tgz

cd /opt
tar -xvf rubygems-1.8.10.tgz
ruby ./rubygems-1.8.10/setup.rb
cd -

ln -s /usr/bin/gem1.8 /usr/bin/gem

# Install chef
gem install chef

# Now install the requisite cookbooks!
chef-solo -c ./solo.rb ./app_server.json
