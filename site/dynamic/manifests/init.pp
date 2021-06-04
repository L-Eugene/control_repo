class dynamic {
  package { ['httpd', 'php']:
    ensure => isntalled
  }
  
  file { '/var/www/php':
    ensure => directory
  }
  
  file { '/var/www/php/index.php':
    ensure => file,
    source => 'puppet:///modules/dynamic/index.php'
  }
  
  file { '/etc/httpd/conf.d/001-demosite.conf':
    ensure => file,
    source => 'puppet:///modules/dynamic/001-demosite.conf',
    notify => Service['httpd']
  }
  
  service { 'httpd':
     ensure => running
  }
}
