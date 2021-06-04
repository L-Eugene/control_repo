node default {
  file { '/root/README':
    ensure => file,
    content => "Hello, world!",
  }
  
  package { 'mysql':
    ensure => absent
  }
  
  include dev_user
  include dev_editor
}

class dev_user(
  $username = 'eugene',
  $password = '$1$pWicQEb0$lGXc.RyHF7VAG7tKOpIap1', #qwerty
  $groups   = ['wheel']
){
  user { $username:
    ensure => present,
    managehome => true,
    groups => $groups,
    password => $password
  }
}

class dev_editor{
  package { 'vim':
    ensure => present
  }
  file { '/home/eugene/.vimrc':
    ensure => file,
    content => 'set number'
  }
}
