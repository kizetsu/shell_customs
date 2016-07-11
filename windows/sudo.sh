# @name gitrc
# @package shell_customs
# @subpackage windows
# @author Ralph Dittrich <kizetsu.rd@googlemail.com>
# @created 28.01.2016
#

sudo() {
	# You have to copy SUDO.cmd to c:\Windows\System32\
	cmd /c 'sudo cmd /k ""c:\Program Files\Git\git-bash.exe""'
}