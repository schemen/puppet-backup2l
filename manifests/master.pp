class backup2l::master {
#
## This is the Backup Master config File
    #Backupuser
    user { 'backupuser':
        ensure      => present,
        managehome  => true,
        name        =>  $backup2l::username,
        home        =>  $backup2l::userhome,
    } ->
    file { "/home/backup":
        ensure => "directory",
        owner  => "backup",
        group  => "backup",
    }
    file {$backup2l::master_pull_file:
      ensure  => present,
      mode     => "0755",
      content => template($backup2l::temp_master_pull_file)
    }
}
