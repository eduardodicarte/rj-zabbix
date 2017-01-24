class zabbix::centos::install::database::pgsql::configure {
  $userdb = 'zbxadm'
  $passdb = 'zbxadm'

  postgresql::server::role{ $userdb:
      password_hash => $passdb,
      superuser     => true,
      require       => [
                          Class['postgresql::globals'],
                          Class['postgresql::server::service'],
                       ]
  } 

  postgresql::server::db { 'zabbix':
     user     => $userdb,
     password => postgresql_password($userdb,$passdb)
  }

  postgresql::server::pg_hba_rule {"allow application to access zabbix database":
    type        => 'host',
    database    => 'zabbix',
    user        => 'zbxadm',
    address     => '0.0.0.0/0',
    auth_method => 'md5'
  }
}
