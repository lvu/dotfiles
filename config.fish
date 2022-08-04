# alias vim (which nvim)

alias ag "ag --hidden --pager 'less -R'"
alias pyag "ag --python"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

. ~/dotfiles/venv_prompt.fish
. ~/dotfiles/auto_venv.fish
auto_venv
source (jenv init -|psub)
# bass source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
set -g fish_user_paths "/usr/local/opt/terraform@0.11/bin" $fish_user_paths
