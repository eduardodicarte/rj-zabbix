class zabbix::centos::install::server {
  package {'zabbix-server-pgsql':
    ensure => present
  } ->

  package {'zabbix-web-pgsql':
    ensure => present
  }
}
