# = Class: backup2l
# Creator: elijah@ponzio.li
# Description of class
#
# == Parameters
# For parameter information, please read the readme
class backup2l(
        $volname    = $backup2l::params::volname,
        $default_srclist= $backup2l::params::default_srclist,
        $srclist    = $backup2l::params::srclist,
        $defaul_skipcond= $backup2l::params::default_skipcond,
        $skipcond   = $backup2l::params::skipcond,
        $backupdir  = $backup2l::params::backupdir,
        $max_level  = $backup2l::params::max_level,
        $max_per_level= $backup2l::params::max_per_level,
        $max_full   = $backup2l::params::max_full,
        $generations= $backup2l::params::generations,
        $checkfile  = $backup2l::params::checkfile,
        $pre_back   = $backup2l::params::pre_back,
        $post_back  = $backup2l::params::post_back,
        $status     = running,
        $install    = present,
        ) inherits backup2l::params {

    # Setup parameters
    
    # Run classes
    anchor {"backup2l::begin":} ~>
    class {"backup2l::package": } ~>
    class {"backup2l::user":} ~>
    class {"backup2l::config":  } ~>
    anchor {"backup2l::end": }

}

