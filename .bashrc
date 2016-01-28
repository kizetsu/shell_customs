# @name bashrc
# @package shell_customs
# @author Ralph Dittrich <kizetsu.rd@googlemail.com>
# @created 28.01.2016
#

#
# commandline modifications
#
export TERM=xterm-256color

if [ -f ~/.prompt.py ]; then
	export PROMPT_COMMAND=__prompt_command
	# if you want to de-activate this: you need to remove the .prompt.py from your home folder
	function __prompt_command() {
	  export ERR=$?
	  ~/.prompt.py --right
	  PS1=$(~/.prompt.py --left)
	}
else
	# LS Colors
	LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=31;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wms=01;35:*.asf=01;35;*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:'
	export LS_COLORS

	PS1="\[\033[1;37m\][\[\033[0;32m\]\u\[\033[1;37m\]@\[\033[1;36m\]\h\[\033[1;37m\]]\[\033[0;32m\]\w \[\033[1;37m\]\$ \[\033[1;35m\]\033[s\033[1;\$((COLUMNS-4))f\$(date +%H:%M)\033[u\[\033[0m\]"
fi

#
# include files
#
# include aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# include functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
# include gitrc
if [ -f ~/.gitrc ]; then
    . ~/.gitrc
fi