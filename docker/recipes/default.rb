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
docker_image 'prakhar1989/static-site' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[static-site]'
end

# Run container mapping containers port 80 to the host's port 80
docker_container 'static-site' do
  repo 'prakhar1989'
  tag 'latest'
  port ['8081:80', '8443:443']
end