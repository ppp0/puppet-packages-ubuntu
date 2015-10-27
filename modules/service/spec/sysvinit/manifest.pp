node default {

  service { 'foo': }

  file{ '/tmp/bar':
    ensure  => file,
    content => template('service/spec/sysvinit/script/bar'),
    owner   => '0',
    group   => '0',
    mode    => '0755',
  }
  ->

  sysvinit::script{ 'foo':
    content => template('service/spec/sysvinit/script/foo'),
    before  => Service['foo'],
  }
}
