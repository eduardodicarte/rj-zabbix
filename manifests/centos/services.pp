class zabbix::centos::services {
  service {"zabbix-server":
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    hasstatus   => true,
    notify      => Service['httpd']
  }

  service{"httpd":
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    hasstatus   => true
  }
}
