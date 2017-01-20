class zabbix::config::host {

  $host_name = 'zabbix'

  file {'/etc/hostname':
    ensure  => file,
    content => "${host_name}"
  }

  host {'localhost.localdomain':
		ensure       => present,
		ip           => '127.0.0.1',
		host_aliases => 'localhost'
	}

  host { "${host_name}.rjconsultores.com.br":
    ensure       => present,
    ip           => '192.164.120.10',
    host_aliases => 'zabbix'
  }
}
