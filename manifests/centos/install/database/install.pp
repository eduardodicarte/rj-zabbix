class zabbix::centos::install::database::install {
  package {'zabbix-server-mysql':
    ensure => present
  }

  package {'zabbix-web-mysql':
    ensure => present
  }
}
