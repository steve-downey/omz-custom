# Decide if we need to set titlebar text.
case $TERM in
  xterm*)
    PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
    ;;
  screen)
    PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
    ;;
  *)
    PR_TITLEBAR=""
    ;;
esac

# Decide whether to set a screen title
if [[ "$TERM" = "screen" ]]; then
  PR_STITLE=$'%{\ekzsh\e\\%}'
else
  PR_STITLE=""
fi

if [ "$USERNAME" = "root" ]; then CARETCOLOR="red"; else CARETCOLOR="white"; fi

local return_code="%(?..%{$fg_bold[red]%}:( %?%{$reset_color%})"


#RPS1='${return_code} %D - %*'
RPS1=''

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[magenta]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ±"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ?"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%} ♥"

ZSH_THEME_VIRTUALENV_PREFIX="("
ZSH_THEME_VIRTUALENV_SUFFIX=")"

PROMPT='${PR_SET_CHARSET}${PR_STITLE}${(e)PR_TITLEBAR}\
$(virtualenv_prompt_info)\
%{$fg_bold[cyan]%}%n%{$reset_color%}%{$fg[yellow]%}@%{$reset_color%}%{$fg_bold[blue]%}%m%{$reset_color%}:%{${fg_bold[green]}%}%~%{$reset_color%}$(git_prompt_info)
%{${fg[$CARETCOLOR]}%}%(!.#.$) %{${reset_color}%}'
