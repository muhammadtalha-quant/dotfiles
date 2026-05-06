function load_prompt #change shell prompt
    # load prompt from a special file
    set prompts catppuccin_frappe catppuccin_latte catppuccin_mocha gruvbox pastel
    if not test -f "./.prompt"
        gen_prompt_config
    end
    set prompt_found (cat "./.prompt" | awk '{ print $2 }')
    if test (string join $prompts) = (string join $prompt_found)
        return 1
    end
    for p in $prompt_found
        if contains $p $prompts
            set -f STARSHIP_PS1 $p
            breakpoint
            break
        end
    end
    set -gx STARSHIP_CONFIG /home/muhammadtalha/.config/starship/$STARSHIP_PS1/prompt.toml
    starship init fish | source
end
