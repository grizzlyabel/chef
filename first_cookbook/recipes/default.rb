#
# Cookbook:: first_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
file "/home/ec2-user/chef/first_cookbook/hello.txt" do
  content "Hello, this is my first cookbook recipe\n"
  action :create
end