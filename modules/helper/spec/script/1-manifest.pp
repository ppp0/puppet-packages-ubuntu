node default {

  $filename = '/tmp/hello'

  file { $filename:
    ensure => absent,
  }

  helper::script { 'write hello world to file':
    environment => ['message=\'Hello world\''],
    content => "env > /tmp/env; echo 'hello world' > ${filename}",
    unless => "ls ${filename} >/dev/null",
  }
}
