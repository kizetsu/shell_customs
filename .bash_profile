# @name bash_profile
# @package shell_customs
# @author Ralph Dittrich <kizetsu.rd@googlemail.com>
# @created 01.03.2016
#

# file imports
test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc
test -f ~/.bash_aliases && . ~/.bash_aliases
test -f ~/.bash_functions && . ~/.bash_functions
test -f ~/.gitrc && . ~/.gitrc