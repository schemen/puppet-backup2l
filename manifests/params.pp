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
    $packages = ["backup2l", "rsync"]

###############################
## Other
    $template_file = 'backup2l/backup2l.conf.erb'
    $config_file = '/etc/backup2l.conf'

###############################
## Backup User params
    $username           = "backup"
    $userhome           = "/home/backup"

###############################
## Backup2l params
    $volname            = "all"
    $default_srclist    = "/etc /root /home"
    $srclist            = ""
    $default_skipcond    = "-path '*.nobackup*' -o -name '*.o'"
    $skipcond           = ""
    $backupdir          = "${userhome}/backups"
    $max_level          = "3"
    $max_per_level      = "8"
    $max_full           = "2"
    $generations        = "1"
    $checkfile          = "1"
    $pre_back           = ['echo sh ./prebackup']
    $post_back          = ['echo sh ./postbackup']
}
