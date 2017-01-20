class zabbix::centos::install::repository {
  $source = 'https://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm'
  $repo = 'zabbix-release-3.0-1.el7.noarch'

  package {$repo:
    ensure   => present,
    provider => 'rpm',
    source   => $source
  }
}
