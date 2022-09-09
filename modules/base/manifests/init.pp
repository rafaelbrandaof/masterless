class base (
  String $username,
) {
   group { "$username": 
	ensure => "present", 
   } 

   user { "$username": 
	ensure => "present", 
	home => "/home/$username", 
	name => "$username", 
	shell => "/bin/bash", 
	managehome => true, 
   } 
   file { "/home/$username":
        ensure => "directory",
        owner => "$username",
        group => "$username",
        mode => "700",
        require => [ User[$username], Group[$username] ],
   }
}
