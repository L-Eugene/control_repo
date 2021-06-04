class profile::vim {
  package { 'vim':
    ensure => present
  }
  file { '/home/eugene/.vimrc':
    ensure => file,
    content => 'set number'
  }
}
