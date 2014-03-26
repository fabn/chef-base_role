#
# Cookbook Name:: base_role
# Recipe:: default
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

# set the hostname for the machine
include_recipe 'hostname'
# Update package cache and install requested packages
include_recipe 'system_base'
# Merge secrets in encrypted databags into node attributes
include_recipe 'system_base::secrets'
# Configures system locale
include_recipe 'system_base::locale'
# Add personal rc files with some aliases and
include_recipe 'system_base::rc_files'
# Install and configure git
include_recipe 'git'
# Configure ntp daemon on every server
include_recipe 'ntp'
# Configure timezone on the given server
include_recipe 'timezone-ii'
# Configure name resolution on server
include_recipe 'base_role::resolver'
