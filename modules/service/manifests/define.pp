define service::define(
  $script,
) {

  case $::initsystem {
    'systemd': {
      service::systemd::script{ $name:
        content => $script
      }
    }

    'sysvinit': {
      service::sysvinit::script{ $name:
        content => $script
      }
    }
    default: {
    fail 'Init system not supported - sysvinit or systemd only'
    }
  }
}
