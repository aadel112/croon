  *     * main
    * reload
    * dispatcher
    * fork_cmd
    * fkd_exec
    * get_croon_cmd
    * get_actions
    * get_nicestr
    * grt_ionicestr
    * get_timestr
    * nice
    * ionice
    * which
    * read_cfg
    * get_opts

## main

     Parameters  : none
     Returns     : int
     Description : This routine runs everything.
                   It sets up the cron object and
                   reloads it with each iteration

## reload

     Parameters  : none
     Returns     : int
     Description : This sub checks the mtime of
                   cron file, and compares it
                   against the last load time
                   of the file from memory, and
                   reloads the file of it needs.
                   The first time, the sub loads 
                   it no matter what.

## dispatcher

     Parameters  : cmd - string, [ skip_fork - bool ]
     Returns     : int
     Description : Is called when the timespec
                   hits the now time
                   execs the cmd by forking it
                   Also prepends nice, ionice,
                   time to each piece it 
                   recognizes as a cmd

## fork_cmd

     Parameters  : cmd - string
     Returns     : inty
     Description : This sub forks the command off

## fkd_exec

     Parameters  : cmd - string
     Returns     : int
     Description : runs the forked command

## get_croon_cmd

     Parameters  : cmd - string
     Returns     : string
     Description : This sub takes a cmd, and
                   prepends the time, nice, and 
                   ionice commands to it
                   to get performance metrics
                   , control priority to cpu on
                   busy systems, and control 
                   priority to io on busy systems

## get_actions

     Parameters  : cmd - string
     Returns     : list
     Description : takes a command and returns 
                   the actionable or executable
                   pieces

## get_nicestr

     Parameters  : proc - string
     Returns     : string
     Description : prepends nice -n$prio
                   where prio is the default, or
                   overriden by the config

## grt_ionicestr

     Parameters  : proc - string
     Returns     : string
     Description : prepends ionice -n$prio
                   where prio is the default, or
                   overriden by the config

## get_timestr

     Parameters  : proc - string
     Returns     : string
     Description : prepends time

## nice

     Parameters  : prio - int
     Returns     : string
     Description : Builds nice -n$prio

## ionice

     Parameters  : prio - int
     Returns     : string
     Description : Builds ionice -n$prio

## which

     Parameters  : cmd - string
     Returns     : string
     Description : Does a which of the exe to find
                   the absolute path

## read_cfg

     Parameters  : none
     Returns     : hash, k => proc, v => hashref
     Description : builds the config stucture

## get_opts

     Parameters  : none
     Returns     : none
     Description : reads the cmdline opts into
                   global variables

