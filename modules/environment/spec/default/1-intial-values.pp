node default {

  environment::variable { 'foo' :
    value => 'bar',
  }

  environment::variable { 'alice' :
    value => 'bob',
  }
}

