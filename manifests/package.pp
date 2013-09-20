# = Class: backup2l::package
# Installs the packages for backup2l module.
class backup2l::package {
    # # Use a list of packages defined in params if additional dependencies are needed.
     package {$backup2l::packages:
       ensure  => $backup2l::install,
     }  
}
