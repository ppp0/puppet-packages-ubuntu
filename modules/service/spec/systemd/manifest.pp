node default {

  service { 'foo': }

  file { '/tmp/bar':
    ensure  => file,
    content => template('service/spec/systemd/script/bar'),
    owner   => '0',
    group   => '0',
    mode    => '0755',
  }
  ->
  file { '/etc/init.d/foo':
    ensure  => file,
    content => template('service/spec/systemd/script/foo.executable'),
    owner   => '0',
    group   => '0',
    mode    => '0755',
  }
  ->

  service::define{ 'foo':
    script  => template('service/spec/systemd/script/foo.service'),
    before  => Service['foo'],
  }
}
