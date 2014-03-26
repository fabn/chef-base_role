#
# Cookbook Name:: base_role
# Recipe:: resolver
#
# Copyright (C) 2014 Fabio Napoleoni
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Configure resolver with static configuration
ruby_block 'disable ubuntu resolvconf' do
  block do
    ::File.delete '/etc/resolv.conf'
  end
  only_if { ::File.symlink? '/etc/resolv.conf' }
end

# Set nameservers to google ones if none given
if node[:resolver][:nameservers].empty?
  node.set[:resolver][:nameservers] = %w(8.8.8.8 8.8.4.4)
end

# Create new content using resolver recipe
include_recipe 'resolver'
