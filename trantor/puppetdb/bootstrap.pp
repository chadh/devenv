class { '::puppetdb::server':
  database_host => '10.250.0.10',
  ssl_listen_address => '0.0.0.0',
  puppetdb_service_status => 'stopped',
}
