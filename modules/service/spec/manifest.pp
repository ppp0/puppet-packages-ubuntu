node default {

  service { ['foo-oneshot', 'foo-daemon']: }

  file { '/tmp/bar':
    ensure  => file,
    content => template('service/spec/bar'),
    owner   => '0',
    group   => '0',
    mode    => '0755',
  }

  file { '/tmp/bar-daemon':
    ensure  => file,
    content => template('service/spec/bar-daemon'),
    owner   => '0',
    group   => '0',
    mode    => '0755',
  }


  service::define{ 'foo-oneshot':
    content  => template('service/spec/foo-oneshot.service'),
    before  => Service['foo-oneshot'],
  }

  service::define{ 'foo-daemon':
    content  => template('service/spec/foo-daemon.service'),
    before  => Service['foo-daemon'],
  }
}
