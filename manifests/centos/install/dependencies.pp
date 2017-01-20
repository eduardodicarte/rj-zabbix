class zabbix::centos::install::dependencies {
  package {'fping':
    ensure => present
  }

  package {'iksemel':
    ensure => present
  }

  package {'libssh2':
    ensure => present
  }
}
