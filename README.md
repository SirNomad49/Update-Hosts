# Update-Hosts
this script allows you to add entrys to your /etc/hosts file

Installation Ubuntu: 

  1.) Check if ksh is installed

       $ dpkg -l ksh 
 *.) if ksh is installed continue to step 2

  b.) install ksh

       $ sudo apt-get install ksh

  2.) move the script to /usr/local/bin

       $ sudo mv ~/update-hosts.ksh /usr/local/bin

  3.) make the script executable

       $ sudo chmod 777 /usr/local/bin/update-hosts.ksh
       
  now the script is usable
  
  so that all users can execute the script without password, continue below
  
  4.) As root, prevent write (and maybe other) access to your script:

       $ chown root /usr/local/bin/update-hosts.ksh
       $ chmod 700 /absolute/path/to/your/script.sh

  5.) Modify sudo access rights in /etc/sudoers with visudo:

        ALL    ALL = (root) NOPASSWD: /usr/local/bin/update-hosts.ksh

More details about the settings (e.g. restricting access to specific users or groups) can be found in the sudoers manpage.

Afterwards, all users can run the script as root without password:

       $ sudo update-hosts.ksh

