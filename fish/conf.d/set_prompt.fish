function set_prompt
    if not test -f "./.prompt"
        printf "error: prompt config file does not exists\n"
        return 1
    end
    nano /home/muhammadtalha/.config/fish/conf.d/.prompt
end
