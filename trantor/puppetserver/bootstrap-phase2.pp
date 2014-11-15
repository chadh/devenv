class { '::puppetserver':
  config => {
    java_args => {
      'xms' => '512m',
      'xmx' => '512m',
    }
  }
}

class { '::puppetdb::master::config':
  puppetdb_server => 'trantor-puppetdb.vm',
  puppetdb_port => 18081,
  restart_puppet => false,
}

Class['Puppetdb::Master::Puppetdb_conf'] -> Service['puppetserver']

file { '/etc/puppet/manifests/site.pp':
  ensure => absent,
}

file { '/etc/puppet/manifests':
  ensure => absent,
}
