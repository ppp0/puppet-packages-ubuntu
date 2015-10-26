node default {

  $filename = '/tmp/hello'

  helper::script { 'do not do anything':
    environment => '',
    content => "echo 'one more line' >> ${filename}",
    unless => "ls ${filename} >/dev/null",
  }
}
