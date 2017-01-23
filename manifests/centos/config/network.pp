class zabbix::centos::config::network {
  $interface = $zabbix::interface
  $ip = $zabbix::ip

  if !$is_virtual {
    package {'gem':
      ensure => 'present'
    } ->

    network_config { $interface:
      ensure    => 'present',
      family    => 'inet',
      ipaddress => $ip,
      method    => 'static',
      netmask   => '255.255.255.0',
      onboot    => 'true',
      require   => Package['gem']
    }
  }
}
