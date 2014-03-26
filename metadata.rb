name             'base_role'
maintainer       'Fabio Napoleoni'
maintainer_email 'f.napoleoni@gmail.com'
license          'Apache 2.0'
description      'Configures basic aspects of new systems'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

depends 'hostname', '~> 0.1.0'
depends 'system_base', '~> 0.2.0'
depends 'git'
depends 'ntp', '~> 1.6.2'
depends 'timezone-ii'
depends 'resolver'
