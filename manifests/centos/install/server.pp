class zabbix::centos::install::server {
  $timezone = "America/Sao_Paulo"

  package {'zabbix-server-pgsql':
    ensure => present
  } ->

  package {'zabbix-web-pgsql':
    ensure => present
  } ->

  file {'zabbix.conf':
    ensure  => file,
    path    => '/etc/httpd/conf.d/zabbix.conf',
    content => template("zabbix/zabbix.conf.erb")
  } ->

  file {'zabbix.conf.php':
    ensure  => file,
    path    => '/etc/zabbix/web/zabbix.conf.php',
    content => template("zabbix/zabbix.conf.php.erb")
  }
}
