class httpd_itzgeek {

    package { 'httpd':
      ensure => present,
    } ->
    file { "/var/www/itzgeek":  # Creating Document Root
      ensure => "directory",
      owner  => "apache",
      group  => "apache",
      mode   => 750,
    } ->
 file { '/var/www/itzgeek/index.html': # Creating Index file
     ensure  => file,
     content => "Index HTML Is Managed By Puppet done by sadham",
     mode    => '0644',
   } ->
    file { '/etc/httpd/conf.d/custom_itzgeek.conf': # Path to the file on client machine
      ensure => file,
      mode   => '0600',
      source => 'puppet:///modules/httpd_itzgeek/custom_itzgeek.conf', # Path to the custom file on puppet server
    } ~>
    service { 'httpd':
      ensure => running,
      enable => true,
    }
}
