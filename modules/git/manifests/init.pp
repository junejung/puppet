class git {
	include git::install
}

class git::install{
	package { 'git:':
		ensure => present
	}
}

#define statement is used to create a custom type that can be used to eleswhere in the manifest, like a function in other languages
define git::clone ( $path, $dir){
	exec { 'clone-$name-$path':
		command => '/usr/bin/git clone git@github.com:$name $path/$dir',
		creates => '$path/$dir',
		require => [Class['git'], File[$path]],
	}
}
