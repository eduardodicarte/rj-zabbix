class zabbix::centos::config::network {
  $interface = $zabbix::interface
  $ip = $zabbix::ip

  package {'gem':
    ensure => 'present'
  } ->

  notify{'Configurando a rede para a interface $zabbix::interface':}

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
