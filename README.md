# croon
A cron-like scheduler daemon with resource management capabilities and logging for *nix systems

## Inspiration
I was inspired to write this because of recent system policies at my own workplace that require authenticating to an ldap server for every cron entry, which has been known to fail multiple times, and is still an unsolved problem. Although, no matter what is done, this is really poor architecture IMHO becuase any technique to mitigate this is unreliable in comparison to a local account, which is 100% reliable. Assuming the problem were 100% fixed, which it never will be, it still takes upwards of 1 second to authenticate, in the best case, which means that your scheduled processes will never run at their scheduled time. I created this as a GPL licensed project as opposed to a closed source, proprietary project because I feel that it can be helpful too many other people. And because general sentiment would favor open source projects in lieu custom coding projects at any place of employment generally speaking because an open source project has many eyes on it, has a set of test cases, etcetera. 

## Applications
* I see many applications for a cron like scheduler. I've already mentioned one. In a system where you are forced to authenticate to an ldap server for each cron entry, you soon see an extra point of failure, which is also a bottleneck to each of you user processes running out of cron. This application allows user control to CPU allocation and io allocation. In heavily regulated environments, where the base user has no root permission it's generally a good idea to nice your basic processes at a higher level than the default so that you can have processes that are guaranteed a larger share of CPU than the default processes. Same goes for io. This is most helpful on very busy systems, otherwise the system will allocate enough resources to the process regardless of prioritization.

An example "hypothetical" situation:

You have an application that was purchased from the third party vendor which is licensed per core and this application has overrun the system in such a way that the load average on the system is over 3 times and number of cores. In such a case, it is impractical to upgrade the box as it would require upgrading your license agreement witch can be prohibitively costly. However, you still want to be able to provide CPU prioritization to certain processes as they're expected to be executed in real time. Croon provides methods to do this because it defaults all of these processes to a 10 nice priority, and you can then define the important proccesses to have a nice priority of 0, which doesn't require elevated user permissions, for example.

In summary, Croon provides a cron like interface, and runs a scheduler Daemon on top of it. It allows you to put all the user processes under one roof, so to speak, so you can control them all together. This brings about basic per process resource allocation loging. It brings about per proprocess resource allocation management. It bypasses poorly architectured ldap authentication schemes. I'm sure there are other applications that I'm not aware of. These are just some basic ones I can think of.

## Use
You can configure Croon as an init or upstart process. By default it runs in daemon mode. It works by reading a cron formatted file and forking off each process into the background as they appear in the timespec. It reads from an optional configuration file which is a comma separated list of the form "Process, Nice Priority, Io Nice Priority, Basic Profile". The default values are "Process, 10, 4, 1". This can also be overridden with command line options.

## Options
-F - The cronfile (required)
-C -overridding configuration file (optional)              
-N - default nice priority (optional)
-D - default ionice priority (optional)                
-P - whether or not to perpend time (optional)
-F - run in foreground instead of as daemon (optional)

## Contributinf
If you'd like to contribute feel free. I'll take any contributions.

## Donating
You can donate if you'd like https://www.paypal.me/aadel112/5
