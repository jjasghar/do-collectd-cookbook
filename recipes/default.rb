#
# Cookbook Name:: do-collectd-cookbook
# Recipe:: default
#
# Copyright (C) 2014
#
#
#

include_recipe "apt"

case node["platform_family"]
when "debian"
  %w{collectd collectd-utils}.each do |pkg|
    package pkg do
      action [:install]
    end
  end

end

template "/etc/collectd/collectd.conf" do
  source "collectd.conf.erb"
  owner "root"
  group "root"
  mode "0755"
end

service "collectd" do
  supports :restart => true
  action :enable
  subscribes :restart, "template[/etc/collectd/collectd.conf]", :immediately
end
