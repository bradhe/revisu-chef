apt-get install ruby build-essential libopenssl-ruby ruby1.8-dev
curl -o /opt/rubygems.tgz http://production.cf.rubygems.org/rubygems/rubygems-1.8.10.tgz

cd /opt
tar -xvf rubygems.tgz
ruby ./rubygems/setup.rb
cd -

# Install chef
gem install chef

# Now install the requisite cookbooks!
chef-solo -c ./solo.rb ./app_server.json
