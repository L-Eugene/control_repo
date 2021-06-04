node default {
}

node 'master.puppet' {
  include role::dev_machine
}

node /slave\d\.puppet/ { 
  include role::web_server
}
