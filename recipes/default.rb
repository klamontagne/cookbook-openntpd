#
# Cookbook Name:: openntpd
# Recipe:: default
#
# Copyright 2013, kaeufli.ch
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

execute 'forget ntpd apparmor profile' do
  action :run
  command 'apparmor_parser -R /etc/apparmor.d/usr.sbin.ntpd'
  only_if { node.platform == 'ubuntu' && node.platform_version >= '12.04'}
  only_if { File::exists? '/etc/apparmor.d/usr.sbin.ntpd' }
end

package 'ntp' do
  action :purge
end

package 'openntpd' do
  action :install
end

service 'openntpd' do
  supports :status => true, :restart => true
  action [:enable, :start]
end

template '/etc/openntpd/ntpd.conf' do
  source 'ntpd.conf.erb'
  owner 'root'
  group 'root'
  mode 00644
  variables(
    :listen => node['openntpd']['listen'],
    :servers => node['openntpd']['servers']
  )
  notifies :restart, "service[openntpd]"
end
