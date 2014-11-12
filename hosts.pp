host { 'localhost.localdomain':
	ensure => present,
	host_aliases => 'localhost',
	ip => '127.0.0.1',
}
host { 'trantor.vm':
	ensure => present,
	host_aliases => 'trantor',
	ip => '10.250.0.10',
}
host { 'anacreon.vm':
	ensure => present,
	host_aliases => 'anacreon',
	ip => '10.250.0.11',
}

