# = Class: backup2l::config
# Deploys configuration for backup2l module.
class backup2l::config {
    # file {$backup2l::config_file:
    #   ensure  => present,
    #   # Sometimes it's useful to define the template in the
    #   # params class.
    #   content => template($backup2l::template_file)
    # } 

    ## Initialising the config files with create_resources
    ## Puppet won't override values defined in config_files.
    #if ($backup2l::config_files != undef) {
    #    create_resources(file, $backup2l::config_files, $backup2l::config_file_defaults)
    #}
}
