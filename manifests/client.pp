# == Class: ssh-client
#
# Manages ssh client
#
# === Parameters
#
# [*ensure*]
# What state the ssh client package should be in.
#

class ssh::client (
  $ensure  = 'present'
  ) {
    package { 'openssh-client':
        ensure  => $ensure
    }
}
