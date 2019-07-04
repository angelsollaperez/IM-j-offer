#
# Cookbook:: dockertest
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
include_recipe 'apt'

docker_service 'default' do
  action [:create, :start]
end

docker_image 'prestashop' do
  repo 'prestashop/prestashop'
  tag 'latest'
  action :pull
end

docker_container 'prestashop' do
  repo 'prestashop/prestashop'
  tag 'latest'
  port '80:80'
  action :run
end
