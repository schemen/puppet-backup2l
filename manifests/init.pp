# = Class: backup2l
# Description of class
#
# == Parameters
# [*parameter1*]
#   Description of parameter1. Default: Foo
# [*parameter2*]
#   Description of parameter2. Default: Bar
class backup2l(
        $parameter1 = $backup2l::params::parameter1,
        $parameter2 = $backup2l::params::parameter2,
        $status     = running,
        $install    = present,
        ) inherits backup2l::params {

    # Setup parameters
    
    # Run classes
    anchor {"backup2l::begin":} ~>
    class {"backup2l::package": } ~>
    class {"backup2l::config":  } ~>
    class {"backup2l::service": } ~>
    anchor {"backup2l::end": }

}

