class profile::dev_user(
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
