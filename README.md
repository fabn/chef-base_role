# Description

[![Build Status](https://travis-ci.org/fabn/chef-base_role.svg)](https://travis-ci.org/fabn/chef-base_role)

[Role wrapper cookbook](http://www.getchef.com/blog/2013/12/03/doing-wrapper-cookbooks-right/) for base
role shared across servers.

# Requirements

## Platform:

* Ubuntu (>= 12.04)

## Cookbooks:

* hostname (~> 0.3)
* system_base (~> 0.2.0)
* git
* ntp (~> 1.6.2)
* timezone-ii
* resolver

# Attributes

* `node[:system_base][:packages]` - Common utility packages useful to have in every system. Defaults to `"[ ... ]"`.
* `node[:ntp][:servers]` - Default ntp servers pool. Defaults to `"%w(0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org)"`.

# Recipes

* [base_role::default](#base_roledefault) - This recipe includes basic recipes to run on every machine.
* [base_role::resolver](#base_roleresolver) - Statically configures name server resolution on Ubuntu system.

## base_role::default

This recipe includes basic recipes to run on every machine.

It configures system [hostname](https://supermarket.getchef.com/cookbooks/hostname), then applies
other system configurations using [system_base](https://github.com/fabn/system_base_cookbook).

It also includes [git](https://supermarket.getchef.com/cookbooks/git),
[ntp](https://supermarket.getchef.com/cookbooks/ntp) and
(timezone)[https://supermarket.getchef.com/cookbooks/timezone-ii] cookbooks.

Finally it configures system hostname resolution with [resolver](#base_roleresolver) recipe.

It should be the very first recipe included in every server.

## base_role::resolver

Statically configures name server resolution on Ubuntu system.

It removes the `'/etc/resolv.conf'` symlink to disable resolvconf daemon and
replaces it with static file configured using [resolver](https://supermarket.getchef.com/cookbooks/resolver) cookbook.

If `node[:resolver][:nameservers]` is empty (default value in resolver cookbook) sets it to
`%w(8.8.8.8 8.8.4.4)` which are public dns servers hosted by Google.

# License and Maintainer

Maintainer:: Fabio Napoleoni (<f.napoleoni@gmail.com>)

License:: Apache 2.0
