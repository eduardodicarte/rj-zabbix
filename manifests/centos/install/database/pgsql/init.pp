class zabbix::centos::install::database::pgsql::init {
    contain zabbix::centos::install::database::pgsql::install
    contain zabbix::centos::install::database::pgsql::configure
    contain zabbix::centos::install::database::pgsql::dump

    #Instalação do banco de dados
    Class['zabbix::centos::install::database::pgsql::install']   ->

    #COnfiguração do banco de dados
    Class['zabbix::centos::install::database::pgsql::configure'] ->

    #Criação de tabelas e execução do dump 
    Class['zabbix::centos::install::database::pgsql::dump']
}
