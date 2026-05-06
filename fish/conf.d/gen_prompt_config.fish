function gen_prompt_config
    if not test -f "./.prompt"
        printf "# more than two uncommented line will cause prompt pollution\n# enable new one by removing '#' symbol, disable the old by putting the '#' infront of it\n PROMPT catppuccin_mocha\n# PROMPT catppuccin_frappe\n# PROMPT pastel\n# PROMPT gruvbox\n# PROMPT catppuccin_latte" >"/home/muhammadtalha/.config/fish/conf.d/.prompt"
    else
        echo "config file already exists"
    end
end
