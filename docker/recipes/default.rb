case node[:platform]
when "ubuntu","debian"
  package "docker.io" do
    action :install
  end

when 'centos','redhat','fedora','amazon'
  package "docker" do
    action :install
  end
end

service "docker" do
  action :start
end

# Pull latest image
docker_image 'nginx' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[my_nginx]'
end

# Run container mapping containers port 80 to the host's port 80
docker_container 'my_nginx' do
  repo 'nginx'
  tag 'latest'
  port '80:80'
  host_name 'www'
  domain_name 'computers.biz'
  env 'FOO=bar'
  volumes [ '/some/local/files/:/etc/nginx/conf.d' ]
end