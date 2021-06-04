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

class dev_user{
  user { 'eugene':
    ensure => present,
    managehome => true,
    group => ['wheel'],
    password => '$1$pWicQEb0$lGXc.RyHF7VAG7tKOpIap1'
  }
}

class dev_editor{
  package { 'vim':
    ensure => present
  }
  file { '/home/eugene/.vimrc':
    ensure => file,
    source => 'puppet:///modules/dev_env/vimrc'
  }
}
