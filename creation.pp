#
class user::creation inherits user::params{

  group {'group_name':
    name   => "${group_name}",
    ensure => present,
    gid    => "${group_id}",
  }
  user {'user_name':
    name     => "${user_name}",
    ensure   => present,
    comment  => "This is a Service Account",
    gid      => "${group_id}",
    home     => "/sample/home",
    shell    => "/bin/bash",
    uid      => "${user_id}",
    require  => Group['group_name']
  }
  file {'file_sample':
     path    => "/sample/",
     ensure  => directory,
     group   => "root",
     mode    => "0755",
     owner   => "root",
     require => User['user_name']
  }
  file {'user_home_dir':
      path    => "/sample/home",
      ensure  => directory,
      group   => "${group_id}",
      mode    => "0755",
      owner   => "${user_id}",
      require => File['file_sample']
  }

}
