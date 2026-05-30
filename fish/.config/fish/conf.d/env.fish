set -gx LANG en_US.UTF-8
set -gx EDITOR nvim
set -gx VISUAL nano
set -x NOCTALIA_VERSION (noctalia -v | awk '{ print $2 }')
fish_add_path $HOME/.local/bin
