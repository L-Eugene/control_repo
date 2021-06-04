node default {
}

node 'master.puppet' {
  include role::dev_machine
}

node 'slave1.puppet' { 
  include role::web_server
}
