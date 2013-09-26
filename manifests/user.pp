class backup2l::user {
    #Backupuser
    user { 'backupuser':
        ensure      => present,
        managehome  => true,
        name        =>  $backup2l::username,
        home        =>  $backup2l::userhome,
        shell       =>  "/usr/bin/rssh"
    } ->
    file { "/home/backup":
        ensure => "directory",
        owner  => "backup",
        group  => "backup",
    }    
    #Backup SSH key
    ssh_authorized_key { $backup2l::sshkey["id"]:
        ensure      =>  present,
        type        =>  $backup2l::sshkey["type"],
        key         =>  $backup2l::sshkey["key"],
        user        =>  $backup2l::username,
    }
}
