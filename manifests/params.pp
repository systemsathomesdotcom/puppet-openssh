class ssh::params {
    $ensure_running     = true
    $ensure_enabled     = true
    $manage_config		= true
    $manage_hostkey     = false
    $manage_known_hosts = true
    $permit_root_login  = 'no'
    $listen_address     = '0.0.0.0'
    $hostaliases        = undef

    $options            = {}

    case $::osfamily {
        'Debian': {
            $service_name = 'ssh'
        }
        'RedHat': {
            $service_name = 'sshd'
        }
        default: {
            fail('unsupported platform')
        }
    }

}
