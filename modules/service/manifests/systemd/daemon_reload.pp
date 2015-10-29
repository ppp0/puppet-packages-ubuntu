class service::systemd::daemon_reload {

  exec { 'systemctl daemon-reload':
    path        => ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin'],
    refreshonly => true,
  }

}
