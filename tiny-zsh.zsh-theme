function get_pwd() {
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root == / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PROMPT='%m:%{$fg[white]%}$(get_pwd)%{$reset_color%}$ '
RPROMPT='$(git_prompt_info) %{$FG[057]%}[%D{%L:%M}]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[105]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# turn these on if you like to have status shown next to the branch name
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✓%{$reset_color%}"
