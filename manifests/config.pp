# = Class: backup2l::config
# Deploys configuration for backup2l module.
class backup2l::config {
     file {$backup2l::config_file:
       ensure  => present,
       # Sometimes it's useful to define the template in the
       # params class.
       content => template($backup2l::template_file)
     }         
     file {$backup2l::pre_back_file:
       ensure  => present,
       # Sometimes it's useful to define the template in the
       # params class.
       mode     => "0755",
       content  => template($backup2l::temp_pre_back_file)
     }         
     file {$backup2l::post_back_file:
       ensure  => present,
       # Sometimes it's useful to define the template in the
       # params class.
       mode     => "0755",
       content => template($backup2l::temp_post_back_file)
     }
    file { "/home/backup/backups":
        ensure => "directory",
    }    
}
