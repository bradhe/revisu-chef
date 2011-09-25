%w{/www/revisu/current /www/revisu/release /www/revisu/shared}.each do |d|
  directory d do
    mode 0755
    owner 'root'
    group 'root'
    recursive true
    action :create
  end
end

template "nginx.conf" do
  path "#{node[:nginx][:dir]}/nginx.conf"
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

gem_package "passenger" do
  action :install
  ignore_failure false
end
