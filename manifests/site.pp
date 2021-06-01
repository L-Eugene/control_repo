node default {
  file { '/root/README':
    ensure => file,
    content => "Hello, world!",
  }
  
  package { 'mysql':
    ensure => present
  }
}
