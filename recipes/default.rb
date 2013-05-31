#
# Cookbook Name:: basic-stats
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

package 'netcat' do
  action :install
  only_if { node['platform_family'] == 'debian' }
end

template "#{node['basic-stats']['location']}/basicstats.sh" do
  source 'basicstats.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables(
    :host => node['basic-stats']['host'],
    :port => node['basic-stats']['port'],
    :interface => node['basic-stats']['interface'],
  )
end

cron 'basic-stats' do
  command "bash #{node['basic-stats']['location']}/basicstats.sh"
  minute node['basic-stats']['cron']['minute']
  hour node['basic-stats']['cron']['hour']
  day node['basic-stats']['cron']['day']
  month node['basic-stats']['cron']['month']
  weekday node['basic-stats']['cron']['weekday']
  action :create
end
