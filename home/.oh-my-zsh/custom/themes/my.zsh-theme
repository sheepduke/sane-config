ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} \ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# PROMPT=$'%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:%{$fg[blue]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)$ '
PROMPT=$'
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %{$fg_bold[green]%}$%{$reset_color%} '
