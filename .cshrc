# $FreeBSD: releng/12.1/share/skel/dot.cshrc 337497 2018-08-08 19:24:20Z asomers $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h		history 25
alias j		jobs -l
alias la	ls --color -aF
alias lf	ls --color -FA
alias ll	ls --color -lAhF
alias ls	ls --color -F
alias mv	mv -i
alias cp	cp -i

# Ruby gems in home folder
setenv GEM_HOME $HOME/.local/gems

# Color on many system utilities
setenv CLICOLOR 1

set path = ($HOME/.local/bin $HOME/.local/gems/bin /usr/local/libexec/ccache $path)

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin)
# setenv	BLOCKSIZE	K
# A righteous umask
# umask 22

setenv	EDITOR	vi
setenv	PAGER	less

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = "%N@%m:%~ %# "
	set promptchars = "%#"

	set filec
	set history = 10000
	set savehist = (10000 merge)
	set autolist = ambiguous
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set nobeep
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
#	bindkey -v
endif

# Delete key funny business
#bind '^[[3~'=delete-char-forward

if ($term == "xterm" || $term == "vt100" \
		|| $term == "vt102" || $term !~ "con*") then
	# bind keypad keys for console, vt100, vt102, xterm
	bindkey "\e[1~" beginning-of-line  # Home
	bindkey "\e[7~" beginning-of-line  # Home rxvt
	bindkey "\e[2~" overwrite-mode     # Ins
	bindkey "\e[3~" delete-char        # Delete
	bindkey "\e[4~" end-of-line        # End
	bindkey "\e[8~" end-of-line        # End rxvt
endif

# This maps the "Delete" key to do the right thing
# Pressing CTRL-v followed by the key of interest will print the shell's
# mapping for the key
bindkey "^[[3~" delete-char-or-list-or-eof

# Include /usr/local as a default include and library path
setenv C_INCLUDE_PATH /usr/local/include
setenv CPLUS_INCLUDE_PATH /usr/local/include
setenv LIBRARY_PATH /usr/local/lib

# CMake options
setenv CMAKE_GENERATOR Ninja
