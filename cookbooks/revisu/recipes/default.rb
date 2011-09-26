
::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless['mysql']['server_root_password'] = secure_password

%w{/www/revisu/release /www/revisu/shared}.each do |d|
  directory d do
    mode 0755
    owner 'ubuntu'
    group 'ubuntu'
    recursive true
    action :create
  end
end

gem_package "passenger" do
  action :install
  ignore_failure false
end

gem_package "bundle" do
  action :install
  ignore_failure false
end

template '/www/revisu/shared/database.yml' do
  source 'database.yml.erb'
  mode 0755
  owner 'ubuntu'
  group 'ubuntu'
end
