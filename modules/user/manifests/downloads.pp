#
class user::downloads inherits user::params {
require user::creation

  file {'file_temp':
	 ensure  => directory,
     path    => "/tmp/temp_binary",
     group   => "root",
     mode    => "0755",
     owner   => "root",
  }
  exec { "download-foo":
	path	=> $::path,
    command => "curl -s -o /tmp/foo.run http://example.com/foo.run",
	cwd		=> "/tmp/temp_binary",
	creates => "/tmp/temp_binary/foo.run",
	require => File['file_temp']
}

}
