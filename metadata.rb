name             'basic-stats'
maintainer       'kaeufli.ch'
maintainer_email 'nd@kaeufli.ch'
license          'MIT'
description      'Installs/Configures basic-stats'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "basic-stats", "Installs a basic stats shell script for statsd"
%w{ubuntu debian freebsd macosx}.each do |os|
  supports os
end
