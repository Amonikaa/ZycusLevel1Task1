#
# Cookbook Name:: testingtomcat
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

yum_package 'java-1.8.0-openjdk.x86_64' do
action :install
end

yum_package 'wget' do
  action :install
end

execute 'tomcat' do 
command 'wget -P /root  http://www-eu.apache.org/dist/tomcat/tomcat-7/v7.0.88/bin/apache-tomcat-7.0.88.tar.gz'
end

execute 'untar' do
command 'tar -xvzf /root/apache-tomcat-7.0.88.tar.gz -C /var/lib'
end


cookbook_file '/var/lib/apache-tomcat-7.0.88/webapps/BookMyDoc2.war' do
  source 'BookMyDoc2.war'
  mode '0777'
  action :create
  end

execute "start" do
  command '/root/tomcat/apache-tomcat-7.0.88/bin/startup.sh'
end

execute "stop" do
  command '/root/tomcat/apache-tomcat-7.0.88/bin/shutdown.sh'
end

execute "start" do
  command '/root/tomcat/apache-tomcat-7.0.88/bin/startup.sh'
end

