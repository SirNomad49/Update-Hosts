#! /bin/ksh
# @Nomad
# Adding or Removing Items to hosts file
# Use -h flag for help

DEFAULT_IP=127.0.0.1
IP=${3:-$DEFAULT_IP}
#----------------------------------------------------------------------------------------------------------
case "$1" in
  add)

        grep "$2"  /etc/hosts >/dev/null
                if [[ $? -eq 0 ]] ; then

                        grep "$3"  /etc/hosts >/dev/null

                        echo "This Host Name is already defined, do you want to update it? [Y/n] "
                                read input
#                               echo "$input"
                                case "$input" in
                                        y|Y|"")
                                                echo "Please Enter the IP you want to Update it to: "
                                                read iptwo
                                                sed -ie "\|^$IP $2\$|d" /etc/hosts
                                                echo "$iptwo $2"  >> /etc/hosts
                                                ;;
                                        *)

                                                echo "bye"
                                                exit 0
                                                ;;
                                esac

                else
                                        echo "$IP $2"  >> /etc/hosts
fi
        ;;
#--------------------------------------------------------------------------------------------------------
  remove)
        sed -ie "\|^$IP $2\$|d" /etc/hosts
        ;;

  *)
        echo "Usage: "
        echo "update-hosts [add|remove] [hostname] [ip]"
        echo 
        echo "Ip defaults to 127.0.0.1"
        echo "Examples:"
        echo "update-hosts add testing.com"
        echo "update-hosts remove testing.com 192.168.1.1"
        exit 1
        ;;
esac

exit 0
