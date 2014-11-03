class django::install {
	package { ["python", "python-dev", "puthon-virtualenv", "python-pip", "python-psycopg2", "python-imaging"]:
	ensure => present,
	}
}
