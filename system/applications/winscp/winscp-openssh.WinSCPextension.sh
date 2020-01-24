# @name OpenSSH
# @command cmd /c start "" %TERMINAL% "%EXTENSION_PATH%" "!U" "!@" "!#" "!S" "!/" "!\" "%DYNAMIC%" "%CDREMOTE%"
# @flag
# @description Connect Using Openssh - with password or keyfile
# @author userdocs
# @version 1.0
# @homepage https://github.com/userdocs/LFTP4WIN-CORE
#
# @option - -config group "Terminal Settings"
#
# @option TERMINAL -config checkbox "Use ConEMU instead of MinTTY" """%WINSCP_PATH%\..\..\bin\mintty.exe"" --Title ""%TITLE%"" -e /bin/bash -li" """%WINSCP_PATH%\..\conemu\ConEmu64.exe"" -run {Bash::bash}" """%WINSCP_PATH%\..\..\bin\mintty.exe"" --Title ""%TITLE%"" -e /bin/bash -li"
#
# @option - -config group "Convenience Settings"
#
# @option CDREMOTE -config checkbox "Automatically CD to remote directory" "no" "yes" "no"
#
# @option - -config group "Port Forwarding Settings"
#
# @option DYNAMIC -config textbox "Enter your Dynamic ssh port here" ""
#
# @option TITLE -run textbox "Windows title!" "!N"
#
#! /usr/bin/env bash
#
winscp_to_bash "$1" "$2" "$3" "$4" "$5" "$6"
#
openssh_known_hosts "$port" "$hostname"
#
export SSHPASS="$password"
#
cd "$local_dir"
#
[[ -n "$7" ]] && DYNAMIC="-D $7" || DYNAMIC=""
[[ -n "$8" && "$8" = 'yes' ]] && CDREMOTE="cd '$remote_dir'; bash -li" || CDREMOTE=""
#
sshpass -e ssh -qt "$DYNAMIC" -p "$port" "$username@$hostname" "$CDREMOTE"
#
exit