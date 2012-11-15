define apache::function::site::available(
  $content = '',
) {
  require apache::server

  file { "${apache::params::virtualhostdir}/${name}":
    ensure  => file,
    content => $content,
    notify  => Class['apache::common::service'],
    require => File[$apache::params::virtualhostdir],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
