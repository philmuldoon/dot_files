set -gx LC_ALL en_GB.UTF-8
set -gx LANG en_GB.UTF-8
set -gx TERM "xterm-256color"

set -gx PATH /usr/local/opt/qt@5.5/bin:/usr/local/bin:$HOME/bin:$HOME/usr/local/bin:/Users/phillipmuldoon/.cask/bin $PATH
set -gx NVM_DIR $HOME/.nvm

alias rsp='bundle exec rspec'
alias rke='bundle exec rails'
alias agi='ag --ignore-dir=tmp --ignore-dir=log --path-to-ignore ~/.ignore'
alias cat='bat'
alias preview="fzf --preview 'bat --color \"always\" {}'"                                                                                                                                    
alias favpn="osascript -e 'tell application \"Viscosity\" to connect \"Corporate VPN V3.0\"'"
alias emacs="/usr/local/opt/emacs-plus/Emacs.app/Contents/MacOS/Emacs"
set -gx EDITOR emacs
set -gx VISUAL $EDITOR
alias hh=hstr                    # hh to be alias for hstr
set HSTR_CONFIG "hicolor"        # get more colors

export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7" 

defaults write -g com.apple.mouse.scaling  6.0

starship init fish | source

export DIRENV_LOG_FORMAT=
direnv hook fish | source