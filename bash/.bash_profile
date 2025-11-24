#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# # pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# # initialize pyenv
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# # if you installed pyenv-virtualenv
# eval "$(pyenv virtualenv-init -)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[ -f /home/TWEL/.dart-cli-completion/bash-config.bash ] && . /home/TWEL/.dart-cli-completion/bash-config.bash || true
## [/Completion]

# Add .NET Core SDK tools
export PATH="$PATH:/home/TWEL/.dotnet/tools"
