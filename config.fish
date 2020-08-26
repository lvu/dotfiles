# export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# eval (python3 -m virtualfish auto_activation global_requirements)
eval (docker-machine env default)

# alias vim (which nvim)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

. ~/dotfiles/venv_prompt.fish
. ~/dotfiles/auto_venv.fish
auto_venv
# bass source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
