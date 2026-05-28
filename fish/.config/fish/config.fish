if status is-interactive
    set -U fish_greeting
    bind --erase ctrl-r
    fzf_configure_bindings --directory=ctrl-f --variables= --processes=ctrl-p --git_log= --git_status= --history=ctrl-h
    fastfetch
end
