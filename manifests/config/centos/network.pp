class zabbix::config::centos::network {
  package {'gem':
    ensure => 'present'
  }

  network_config { $zabbix::interface:
    ensure    => 'present',
    family    => 'inet',
    ipaddress => $zabbix::ip,
    method    => 'static',
    netmask   => '255.255.255.0',
    onboot    => 'true',
    require   => Package['gem']
  }
}
