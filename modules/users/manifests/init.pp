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
}
