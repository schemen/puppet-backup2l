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
    $packages           = ["backup2l", "rsync", "rssh"]

###############################
## Backup User params
    $username           = "backup"
    $userhome           = "/home/backup"

###############################
## Other
    $template_file      = 'backup2l/backup2l.conf.erb'
    $config_file        = '/etc/backup2l.conf'

    $rssh_template_file      = 'backup2l/rssh.conf.erb'
    $rssh_config_file        = '/etc/rssh.conf'

    $temp_pre_back_file = 'backup2l/prebackup.sh.erb'
    $pre_back_file      = '/usr/local/bin/prebackup'

    $temp_post_back_file= 'backup2l/postbackup.sh.erb'
    $post_back_file     = '/usr/local/bin/postbackup'

###############################
## Backup2l params
    $volname            = "${::hostname}"
    $default_srclist    = "${userhome}/mysql /etc /root"
    $srclist            = ""
    $default_skipcond   = "-path '*.nobackup*' -o -name '*.o' -path '${userhome}/backups' -o -path '${userhome}/backups/*'"
    $skipcond           = ""
    $backupdir          = "${userhome}/backups"
    $max_level          = "3"
    $max_per_level      = "8"
    $max_full           = "2"
    $generations        = "1"
    $checkfile          = "1"
    $pre_back           = ['prebackup']
    $post_back          = ['postbackup']
###############################
## MySQL params
    $backupdb           =  ""
}
