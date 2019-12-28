# @name Terminal
# @command cmd /c start "" %TERMINAL% "%EXTENSION_PATH%" "!U" "!@" "!#" "!S" "!/" "!\" "%LOCALCD%"
# @side Local
# @flag
# @description Start a terminal session in the home directory. Default is MinTTy. You can select ConEMU from the custom command preferences.
# @author userdocs
# @version 1.0
# @homepage https://github.com/userdocs/LFTP4WIN-CORE
#
# @option - -config group "Terminal Settings"
#
# @option TERMINAL -config checkbox "Use ConEMU instead of MinTTY" """%WINSCP_PATH%\..\..\bin\mintty.exe"" --Title LFTP4WIN -e /bin/bash -li" """%WINSCP_PATH%\..\conemu\ConEmu64.exe"" -run {Bash::bash}" """%WINSCP_PATH%\..\..\bin\mintty.exe"" --Title LFTP4WIN -e /bin/bash -li"
#
# @option - -config group "Convenience Settings"
#
# @option LOCALCD -config checkbox "Automatically CD to remote directory" "no" "yes" "no"
#
#! /usr/bin/env bash
#
winscp_to_bash "$1" "$2" "$3" "$4" "$5" "$6"
#
openssh_known_hosts "$port" "$hostname"
#
[[ -n "$7" && "$7" = 'yes' ]] && cd "$local_dir" || :
#
export set CHERE_INVOKING=1
#
bash -li
#
exit