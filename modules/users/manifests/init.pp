class users{

	user { 'jjung':
        	ensure => 'present',
        	groups => ['sudo', 'ubuntu'],
        	home => '/home/jjung',
        	managehome => true,
        	password => '$6$lY2Gp3Cr$zNrUB7T3yibUF/gWn5cTQ0fNv7MUmx/DZuw3E7I..Vh9tITG28BtgvXJPU4Gm4Z/9oNvlbX24KzQ9Ib1QH1B9.',
        	shell => '/bin/bash',
        	require => User['ubuntu']
	}

	user { 'ubuntu':
        	ensure => 'present'
	}
	
	file { '/home/jjung':
		ensure => directory,
		owner => jjung,
		group => jjung,
		mode => 755,
		source => 'puppet:///modules/users/jjung',
		recurse => remote,
		require => User['jjung']
	}

	ssh_authorized_key { 'jjung':
		ensure => 'present',
		user => 'jjung',
		type => 'rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDj7GSnMp3hOsNcceQrwVEID2OPMm4wJCtymT0Q5OXPgq/PBHit7AT+r3XwtUDDgGruF8g+n2yiSqJXaO23oM0yzt4nbVt3PTlkNQvYlG0r6wQXtC//ZxX7P0aPFlKHnTXVc9Lu08pwFQDTnx9n+cfWgruFwOdqirTUhvHVKPtlH4JGl2wleTmUTClPSjb0FfgZ+FmxZviZH3dRzfHPPH712N8nOuUzfT/9MtovTa8UCyKxRwvSJv97Rj7lV92r7xWKAQaRJbR0ovNXZYk1O3xCH3QIbGI6CcB2R8KefHLtV0eTOCI12oyJ2KFrUKGjThxDu9SUaRW8lkF4+ednQ7av'
	}
}
