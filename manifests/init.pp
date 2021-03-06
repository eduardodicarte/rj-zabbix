# Class: zabbix
# ===========================
#
# Full description of class zabbix here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'zabbix':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class zabbix ($ip='192.164.120.10',$gw='192.168.0.1', $interface='enp0s3'){

  contain zabbix::config::host
  contain zabbix::centos::config::network
  contain zabbix::centos::install::repository
  contain zabbix::centos::install::dependencies
  contain zabbix::centos::install::database::pgsql::init
  contain zabbix::centos::install::server
  contain zabbix::centos::services

  #Configuração do hostname
  Class['zabbix::config::host'] ->

  #Configuração da rede
  Class['zabbix::centos::config::network'] ->

  #instalação do repositório do zabbix
  Class['zabbix::centos::install::repository'] ->

  #instalação de dependencias
  Class['zabbix::centos::install::dependencies'] ->

  #Instalando e configurando o banco de dados (Postgres - Suportado por essa instalação)
  Class['zabbix::centos::install::database::pgsql::init'] ->

  #Instalando o zabbix server e zabbix web
  Class['zabbix::centos::install::server'] ->

  #Start nos serviços do zabbix
  Class['zabbix::centos::services']
}
