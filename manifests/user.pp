class backup2l::user {
    #Backupuser
    user { 'backupuser':
        ensure      => present,
        managehome  => true,
        name        =>  $backup2l::username,
        home        =>  $backup2l::userhome,
        shell       =>  "/bin/nologin"
    } ->
    
    #Backup SSH key
    ssh_authorized_key { $backup2l::sshkey["id"]:
        ensure      =>  present,
        type        =>  $backup2l::sshkey["type"],
        key         =>  $backup2l::sshkey["key"],
        user        =>  $backup2l::username,
    }
}
