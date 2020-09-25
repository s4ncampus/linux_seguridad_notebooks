#!/usr/bin/expect -f
spawn kpcli --no-recycle --command "saveas ./mi_basededatos.kdbx"
expect -exact "Please provide the master password:"
send -- "LINUX_RULES\r"
expect -exact "Retype to verify:"
send -- "LINUX_RULES\r"
expect eof