  class system {

    package {
        ['vim', 'curl', 'screen','git','mc','ack','subversion', 'gzip','strace', 'augeas-tools', 'libaugeas-dev', 'libaugeas-ruby']:
        ensure  => installed
    }

    file { '/etc/motd':
        content => "\nVagrant Box\n\n"
    }

    exec { "apt-get update":
        command => "/usr/bin/apt-get update"
    }

    file { '/logs':
        ensure  => directory,
        owner   => vagrant,
        group   => vagrant,
        mode    => 644,
      }

      file { '/logs/mysql.log':
        ensure  => file,
        require => File['/logs'],
        owner   => mysql,
        group   => vagrant,
        mode    => 644,
      }

      file { '/logs/php.log':
        ensure  => file,
        require => File['/logs'],
        owner   => www-data,
        group   => vagrant,
        mode    => 644,
      }
}