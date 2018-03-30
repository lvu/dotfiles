# export PATH="/usr/local/opt/python/libexec/bin:$PATH"
eval (python -m virtualfish auto_activation global_requirements)
eval (docker-machine env default)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
bass source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
