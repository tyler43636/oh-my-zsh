# Color shortcuts
R=$fg[red]
G=$fg[green]
M=$fg[magenta]
RB=$fg_bold[red]
YB=$fg_bold[yellow]
BB=$fg_bold[blue]
RESET=$reset_color

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '<' && return
    hg root >/dev/null 2>/dev/null && echo 'Hg' && return
    echo '#'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

PROMPT='
%{$M%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
$(virtualenv_info)$(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
