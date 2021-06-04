node default {
  file { '/root/README':
    ensure => file,
    content => "Hello, world!",
  }
  
  package { 'mysql':
    ensure => absent
  }
  
  include dev_user_eugene
}

class dev_user_eugene (
  $password = '$1$pWicQEb0$lGXc.RyHF7VAG7tKOpIap1', #qwerty
  $groups   = ['wheel']
) {
  class { 'dev_user':
    username => 'eugene',
    password => $password,
    groups => $groups
  }
  
  include dev_editor
}

node 'slave1.puppet' { 
  class { 'apache': }
}

class dev_user(
  $username = 'eugene',
  $password = '$1$pWicQEb0$lGXc.RyHF7VAG7tKOpIap1', #qwerty
  $groups   = ['wheel']
){
  group { $groups:
    ensure => present
  }
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
