class zabbix::centos::install::database::pgsql::dump {

  $query_schema_test = "select hostid from hosts"
  $query_images_test = "select imageid from images where imageid=1"
  $query_data_test = "select userid from users where userid=1"

  #copiando arquivo schema.sql para a pasta tmp
  file {'/tmp/schema.sql':
    ensure => file,
    owner  => 'postgres',
    group  => 'root',
    mode   => '0770',
    source => 'puppet:///modules/zabbix/schema.sql'
  } ->

  #executando o script schema.sql
  exec {'generate_schema':
    command => 'psql -d zabbix < schema.sql',
    cwd     => '/tmp',
    path    => '/usr/bin',
    user    => 'postgres',
    unless  => "psql -d zabbix -c $query_schema_test"
  } ->

  #copiando arquivo images.sql para a pasta tmp
  file {'/tmp/images.sql':
    ensure => file,
    owner  => 'postgres',
    group  => 'root',
    mode   => '0770',
    source => 'puppet:///modules/zabbix/images.sql'
  } ->

  #executando o script images.sql
  exec {'generate_images':
    command => 'psql -d zabbix < images.sql',
    cwd     => '/tmp',
    path    => '/usr/bin',
    user    => 'postgres',
    unless  => "psql -d zabbix -c $query_images_test"
  } ->

  #copiando arquivo data.sql para a pasta tmp
  file {'/tmp/data.sql':
    ensure => file,
    owner  => 'postgres',
    group  => 'root',
    mode   => '0770',
    source => 'puppet:///modules/zabbix/data.sql'
  } ->

  #executando o script data.sql
  exec {'generate_data':
    command => 'psql -d zabbix < data.sql',
    cwd     => '/tmp',
    path    => '/usr/bin',
    user    => 'postgres',
    unless  => "psql -d zabbix -c $query_data_test"
  }
}
