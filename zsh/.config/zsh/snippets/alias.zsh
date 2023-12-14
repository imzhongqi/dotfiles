command_check() {
	command -v "$1" &>/dev/null && alias "$2"
}

# global alias
alias rm='rm -i'   	rd='rmdir'   		md='mkdir -p'
alias la='ls -la'  	lt='ls --tree'  	ll='ls -l'  l='ls'
alias dfh='df -h' 	dus='du -sh' 		del='gio trash' dusa='dus --apparent-size'
alias reload="exec $SHELL -l -i"  		grep="command grep --colour=auto --binary-files=without-match --directories=skip"
alias df='df -h'  	du='du -h'  plast="last -20"
alias cp='cp -v'   	mv='mv -v'
alias ts='date +%s'

command_check exa 		'ls=exa -bh --icons'
command_check bat 		'cat=bat --plain'
command_check kitty 	's=kitty +kitten ssh'
