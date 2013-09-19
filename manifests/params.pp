# = Class: backup2l::params
# Defines parameters for backup2l.
class backup2l::params {
    # Handle operatingsystem dependencies inside the parameters class. 

    case $::osfamily {
        debian: {$supported = true}
	ubuntu: {$supported = true}
        default: {
            fail("Operating System unsupported. Adding support in backup2l::params should be sufficient.")
        }
    }

###############################
## Useful defaults
    $puppet_source_path = "puppet:///modules/backup2l"
    
## Service
    $service_name = 'backup2l'

###############################
## Other
    $template_file = 'fancymodule/template.erb'
    $config_file = '/etc/fancymodule'
}
