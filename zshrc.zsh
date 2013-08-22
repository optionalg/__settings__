# This is my ZSH configuration file that relies on zprezto.

# Set the key mapping style to 'emacs' or 'vi'.
#zstyle ':prezto:module:editor' keymap 'vi'

# Auto convert .... to ../..
zstyle ':prezto:module:editor' dot-expansion 'yes'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':prezto:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':prezto:module:terminal' auto-title 'yes'

# Set the Zsh modules to load (man zshmodules).
zstyle ':prezto:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
zstyle ':prezto:load' zfunction 'zargs' 'zmv'

#
# GPG-Agent
#

# Enable SSH-Agent protocol emulation.
# zstyle ':prezto:module:gpg-agent' ssh-support 'yes'

#
# SSH-Agent
#

# Enable ssh-agent forwarding.
# zstyle ':prezto:module:ssh-agent' forwarding 'yes'

# Set ssh-agent identities to load.
# zstyle ':prezto:module:ssh-agent' identities 'id_rsa' 'id_rsa2' 'id_github'


# Set syntax highlighters.
# By default main, brackets, and cursor are enabled.
zstyle ':prezto:module:syntax-highlighting' color 'yes'
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'cursor'

# Set the modules to load (browse modules).
# The order matters.

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'sorin'

if [[ "$TERM_PROGRAM" == "DTerm" ]]; then
    # these are only executed in DTerm shells
    zstyle ':prezto:*:*' color 'no'
    zstyle ':prezto:load' pmodule \
    'environment' \
    'terminal' \
    'directory' \
    'spectrum' \
    'utility' \
    'completion' \
    'python' \
    'osx' \
    'git' \
    'archive'
else
    # these are only executed in non-DTerm shells
    zstyle ':prezto:load' pmodule \
    'environment' \
    'terminal' \
    'editor' \
    'history' \
    'directory' \
    'spectrum' \
    'utility' \
    'completion' \
    'osx' \
    'git' \
    'archive' \
    'syntax-highlighting' \
    'history-substring-search' \
    'prompt'
fi

source "$HOME/.zprezto/init.zsh"

# Customize to your needs...
###############################################################################


#----- My command line `note` tool to push to OS X notification center.
source "$HOME/Dropbox/note/note.sh"

#----- Report timing statistics after long commands:
export REPORTTIME=10

# function virtualenv_info {
  # [ $VIRTUAL_ENV ] && echo ' ('`basename $VIRTUAL_ENV`') '
# }

function prompt_sorin_pwd {
# This helps me to see if I am in my production or testing homebrew install
if [[ "$(which brew)" == "/homebrew/bin/brew" ]]; then
    export _brew_info='🍺 '
  else
    export _brew_info=''
  fi
}

# Redefine how the prompt looks.
zstyle ':prezto:module:editor:info:keymap:primary' format ''
zstyle ':prezto:module:git:info:branch' format '%b%f'
zstyle ':prezto:module:git:info:clean' format '%F{113}'
zstyle ':prezto:module:git:info:ahead' format ' %%B%F{yellow}⬆ %%b%F{yellow}%A%f%%b'
zstyle ':prezto:module:git:info:behind' format ' %%B%F{yellow}⬇ %%b%F{yellow}%B%f%%b'
zstyle ':prezto:module:git:info:stashed' format ' %%B%F{cyan}💼 %f%%b'
zstyle ':prezto:module:git:info:modified' format ' %%B%F{blue}🔨 %f%%b'
zstyle ':prezto:module:git:info:untracked' format ' %%B%F{white}🚧 %f%%b'
zstyle ':prezto:module:git:info:unmerged' format ' %%B%F{yellow}⚡ %f%%b'
zstyle ':prezto:module:git:info:keys' format \
  'prompt'  ' %F{242}±%f$(coalesce "%C%b" "%p" "%c")%s' \
  'rprompt' '%A%B%S%a%d%m%r%U%u'
PROMPT_PATH_MAX_LENGTH=30
PROMPT='${SSH_TTY:+[%n@%m]}%F{cyan}%$PROMPT_PATH_MAX_LENGTH<…<%~%<< %F{113}%(?::%F{red})%(!.%B❯❯❯%f%b.%B❯%f%b) '
RPROMPT='%F{242}%* ${_brew_info}${editor_info[keymap]}${editor_info[overwrite]}%(?:: %F{red}⏎%f)${VIM:+" %B%F{green}V%f%b"}%f${git_info:+${(e)git_info[prompt]}}${git_info[rprompt]}'


#----- l - I am so used to it.
alias l='ls'

#----- My own little shell functions to make grep and find usable
alias grepall='noglob grepall'
alias findall='noglob findall'

#----- zprezto overdid it. Who can remember all these?
unalias gbc
unalias gbx
unalias gbX
unalias gbm
unalias gbM
unalias gca
unalias gcp
unalias gcP
unalias gcr
unalias gcR
unalias gcs
unalias gcl
unalias gd
unalias gdc
unalias gdx
unalias gdm
unalias gdu
unalias gdk
# unalias gdi
# unalias glg
alias glg='git log --color --topo-order --all --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'
unalias gfc
unalias gfm
unalias gfr
unalias gia
unalias giA
unalias giu
unalias gir
unalias giR
unalias gix
unalias giX
unalias gm
unalias gmC
unalias gmF
unalias gma
unalias gp
unalias gpf
unalias gpa
unalias gpA
unalias gpt
unalias gpc
unalias gpp
unalias gR
unalias gRl
unalias gRa
unalias gRx
unalias gRm
unalias gRu
#unalias gRc
unalias gRs
unalias gRb
unalias gs
unalias gsa
unalias gsx
unalias gsX
unalias gsd
unalias gsl
unalias gsL
unalias gsp
unalias gsr
unalias gss
unalias gsS
unalias gsw
unalias gS
unalias gSa
unalias gSf
unalias gSi
unalias gSI
unalias gSl
unalias gSm
unalias gSs
unalias gSu
unalias gSx
unalias gwr
unalias gwR
unalias gwc
unalias gwC
unalias gwx
unalias gwX