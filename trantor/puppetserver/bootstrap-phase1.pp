class { '::puppetserver':
  config => {
    java_args => {
      'xms' => '512m',
      'xmx' => '512m',
    }
  },
  start => false,
}

ini_setting { "enable autosign":
    path    => '/etc/puppet/puppet.conf',
    section => 'master',
    setting => 'autosign',
    value   => 'true',
    ensure  => present,
}

ini_setting { "set certname":
    path    => '/etc/puppet/puppet.conf',
    section => 'main',
    setting => 'certname',
    value   => 'trantor-puppetserver.vm',
    ensure  => present,
}

file { '/etc/puppet/manifests':
  ensure => directory,
  mode => '0755',
  owner => 'root',
  group => 'root',
}

file { '/etc/puppet/manifests/site.pp':
  ensure => present,
  content => "node default { notify { 'Caught by Default Node!': } }",
  mode => '0644',
  owner => 'root',
  group => 'root',
}

