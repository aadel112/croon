# croon
A cron-like scheduler daemon with resource management capabilities and logging for *nix systems

## Inspiration
I was inspired to write this because recent system policies at my own workplace that require authenticating to an ldap server for every friend entry, which has been known to fail multiple times, and is still an unsolved problem. Ivan this is a CPL license project as opposed to it close Source proprietary project because I feel that can be helpful too many other people. And because General sentiment would favor open source projects of custom coding projects at any place of employment generally speaking because an open source project as many eyes on it has a set of test cases etcetera. 

## Applications
* I see many applications for a cron like scheduler. I've already mentioned one. In a system where you are forced to authenticate to an ldap server 4 East cron entry, you soon see an extra point of failure which is also a bottleneck to each of you user processes running out of Cron. This application allows user control 2 CPU allocation and I owe allocation. In heavily regulated environments where the face user has no root permission it's generally I do too nice your basic processes at a higher level than the default so that you can half processes are guaranteed a larger share of CPU than the default processes. Same goes for Io. This is most helpful and very busy systems, otherwise the system will allocate enough resources to the process regardless of prioritization.

For example hypothetical situation will be that you have an application that was purchased from the third party vendor which is licensed per CPU core and this application has overwrite the system in such a way that the load average on the system is over 3 times and number of course. In such case it is Impractical to upgrade the box as it would require upgrading your license agreement with maybe prohibitively costly. However you still want to be able to provide CPU prioritization to certain processes as they're expected to be executed in real time. Truman provides methods to this because it default all of these processes 210 for example.

In summary, Chrome provides a cron like interface, Runza scheduler Daemon, it allows you to put all the use of processes Under One Roof so to speak can control them all together. The Rings about basic Perl process resource allocation login. It brings about proprocess record Source allocation management. The bypasses poorly architecture ldap authentication schemes. I'm sure there are other applications that I'm going to wear off. These are just some basic ones I can think of.

## Use
You can configure Kronos is an internet or upstart process. By the Fall it runs Indian loan. It works by reading a cron formatted file and forking off each process into the background as they appear in the times back. It reads from an optional configuration file which is a comma separated list of the Forum "Process, Nice Priority, Io Nice Priority, Basic Profile". The default values are "process, 10, 4, 1". This can also be overwritten with command line options.

## Options
-F - The cronfile (required
-C -overridding configuration file (optional)              
-N - default nice priority 
-D - default ionice priority (optional)                
-P - whether or not to perpendicular time      
-F - run in foreground instead of as daemon

## Contributinf
If you'd like to contribute feel free I'll take any contributions.

## Donating
You can donate if you'd like https://www.paypal.me/aadel112/5
