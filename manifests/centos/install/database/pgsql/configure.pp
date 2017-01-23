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
}
