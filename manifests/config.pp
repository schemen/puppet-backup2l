# = Class: backup2l::config
# Deploys configuration for backup2l module.
class backup2l::config {
     file {$backup2l::config_file:
       ensure  => present,
       # Sometimes it's useful to define the template in the
       # params class.
       content => template($backup2l::template_file)
     } 
}
