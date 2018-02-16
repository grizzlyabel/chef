#
# Cookbook:: first_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
file "/etc/chef/first_cookbook/hello.txt" do
  content "Yaya, we made it!\n"
  action :create
end