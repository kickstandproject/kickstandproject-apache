class apache::common::config {
  file { $apache::params::defaultfile:
    ensure  => file,
    content => template('apache/etc/default/apache2.erb'),
    require => Class['apache::common::install'],
  }

  file { $apache::params::basedir:
    ensure  => directory,
    require => Class['apache::common::install'],
  }

  file { "${apache::params::basedir}/sites-enabled":
    ensure  => directory,
    force   => true,
    purge   => true,
    recurse => true,
    require => File[$apache::params::basedir],
  }

  file { $apache::params::configdir:
    ensure  => directory,
    purge   => true,
    recurse => true,
    require => File[$apache::params::basedir],
  }

  file { "${apache::params::configdir}/security":
    ensure  => file,
    content => template('apache/etc/apache2/conf.d/security.erb'),
    require => File[$apache::params::configdir],
  }

  file { $apache::params::configfile:
    ensure  => file,
    content => template('apache/etc/apache2/apache2.conf.erb'),
    require => File[$apache::params::basedir],
  }

  file { $apache::params::rootdir:
    ensure  => directory,
    force   => true,
    purge   => true,
    recurse => true,
    require => Class['apache::common::install'],
  }

  file { $apache::params::logdir:
    ensure  => directory,
    require => Class['apache::common::install'],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
