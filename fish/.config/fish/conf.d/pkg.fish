function pkg --description "Package manager wrapper  alpm · aur · flathub"

    argparse --name=pkg \
        'h/help' \
        'y/yes' \
        's/source=' \
        -- $argv
    or return 1

    # ── help / no args ───────────────────────────────
    if set -q _flag_help; or test (count $argv) -eq 0
        _pkg_help
        return 0
    end

    # ── action ───────────────────────────────────────
    set -l action $argv[1]
    if not contains -- $action install remove
        gum log --level error "unknown action '$action'  →  use: install | remove"
        return 1
    end

    # ── source: flag → picker ────────────────────────
    set -l source $_flag_source
    if test -z "$source"
        set source (gum choose \
            --header "  Source:" \
            --cursor "▸ " \
            alpm aur flathub)
        test -z "$source"; and return 0
    end

    if not contains -- $source alpm aur flathub
        gum log --level error "unknown source '$source'  →  use: alpm | aur | flathub"
        return 1
    end

    # ── dep check ────────────────────────────────────
    _pkg_check_deps $source; or return 1

    # ── fzf selection ────────────────────────────────
    set -l selected (_pkg_fzf_select $action $source)
    set -l fzf_exit $status   # 0=ok  1=no match  130=esc/ctrl-c

    if test $fzf_exit -eq 130
        return 0               # user cancelled — silent exit
    end

    if test (count $selected) -eq 0; or test -z "$selected[1]"
        gum log --level warn "no packages selected"
        return 0
    end

    # ── PKGBUILD review (AUR install only) ──────────────────
    if test "$source" = aur; and test "$action" = install; and not set -q _flag_yes
        if gum confirm "  Review PKGBUILD(s) before installing?"
            for p in $selected
                gum log --level info "fetching PKGBUILD: $p"
                set -l tmp (mktemp --suffix="-$p.PKGBUILD")
                curl -sL "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=$p" -o $tmp 2>/dev/null
                if test -s "$tmp"
                    if command -q bat
                        bat --language=bash --style=numbers,header,grid --paging=always $tmp
                    else
                        gum pager --show-line-numbers < $tmp
                    end
                else
                    gum log --level warn "could not fetch PKGBUILD for $p"
                end
                rm -f $tmp
            end
            gum confirm "  Proceed with install?" || return 0
        end
    end

    # ── confirm (remove only; install was chosen via fzf) ───
    if test "$action" = remove; and not set -q _flag_yes
        gum confirm "  Remove "(count $selected)" package(s)?" || return 0
    end

    # ── FIX #4: forward -y to _pkg_execute so yay gets --noconfirm ──
    set -l yes_arg
    set -q _flag_yes; and set yes_arg -y

    _pkg_execute $action $source $yes_arg $selected
    return $status
end


# ── _pkg_help ─────────────────────────────────────────────────────────────────

function _pkg_help
    set_color --bold brwhite;  echo "pkg  ·  package manager wrapper";  set_color normal
    set_color brblack;         echo "pacman (alpm)  ·  yay (aur)  ·  flatpak (flathub)"; set_color normal
    echo ""
    set_color --bold;    echo "USAGE";  set_color normal
    echo "  pkg install|remove [-s alpm|aur|flathub] [-y]"
    echo "  pkg --help"
    echo ""
    set_color --bold;    echo "ACTIONS";  set_color normal
    echo "  install   browse & install packages"
    echo "  remove    browse & uninstall packages"
    echo ""
    set_color --bold;    echo "FLAGS";  set_color normal
    echo "  -s, --source=<s>   alpm · aur · flathub  (omit for interactive picker)"
    echo "  -y, --yes          skip confirms, PKGBUILD review, and backend prompts"
    echo "  -h, --help         show this help"
    echo ""
    set_color --bold;    echo "EXAMPLES";  set_color normal
    set_color brblack
    echo "  pkg install -s alpm          # search official repos"
    echo "  pkg remove  -s aur           # remove an AUR package"
    echo "  pkg install -s flathub -y    # install flatpak, skip confirm"
    echo "  pkg remove                   # pick source interactively"
    set_color normal
    echo ""
    set_color brblack
    echo "  fzf:  TAB=select  ctrl-a=all  ctrl-d=none  ctrl-/=preview  esc=cancel"
    set_color normal
end


# ── _pkg_check_deps ───────────────────────────────────────────────────────────

function _pkg_check_deps
    set -l source $argv[1]

    # FIX #1: check gum first with echo, not gum log (bootstrap issue)
    if not command -q gum
        echo "pkg: missing required tool: gum  (https://github.com/charmbracelet/gum)" >&2
        return 1
    end

    if not command -q fzf
        gum log --level error "missing required tool: fzf"
        return 1
    end

    switch $source
        case alpm
            if not command -q pacman
                gum log --level error "pacman not found — are you on Arch Linux?"
                return 1
            end
        case aur
            if not command -q yay
                gum log --level error "yay not found — install from https://github.com/Jguer/yay"
                return 1
            end
        case flathub
            if not command -q flatpak
                gum log --level error "flatpak not found — install with: sudo pacman -S flatpak"
                return 1
            end
            # make sure flathub remote exists
            if not flatpak remotes | grep -q flathub
                gum log --level warn "flathub remote not configured"
                gum confirm "  Add Flathub remote now?" || return 1
                flatpak remote-add --if-not-exists flathub \
                    https://dl.flathub.org/repo/flathub.flatpakrepo
            end
    end
end


# ── _pkg_fzf_select ───────────────────────────────────────────────────────────

function _pkg_fzf_select
    set -l action $argv[1]
    set -l source $argv[2]

    set -l fzf_opts \
        --multi \
        --cycle \
        --height=80% \
        --layout=reverse \
        --border=rounded \
        --info=inline \
        --prompt="  ❯ " \
        --pointer="▸" \
        --marker="✓ " \
        --color="border:212,header:212,prompt:212,pointer:212,marker:82,hl:226,hl+:226" \
        --bind="ctrl-a:select-all,ctrl-d:deselect-all,ctrl-/:toggle-preview,esc:abort"

    switch "$source/$action"

        case alpm/install
            pacman -Slq 2>/dev/null \
                | fzf $fzf_opts \
                    --preview="pacman -Si {} 2>/dev/null" \
                    --preview-window="right:45%:wrap:hidden" \
                    --header=" alpm install — TAB=multi  ctrl-/=preview"

        case alpm/remove
            pacman -Qq 2>/dev/null \
                | fzf $fzf_opts \
                    --preview="pacman -Qi {} 2>/dev/null" \
                    --preview-window="right:45%:wrap" \
                    --header=" alpm remove — installed packages"

        case aur/install
            yay -Slq --aur 2>/dev/null \
                | fzf $fzf_opts \
                    --preview="yay -Si {} 2>/dev/null" \
                    --preview-window="right:45%:wrap:hidden" \
                    --header=" aur install — TAB=multi  ctrl-/=preview"

        case aur/remove
            yay -Qm 2>/dev/null \
                | awk '{print $1}' \
                | fzf $fzf_opts \
                    --preview="yay -Qi {} 2>/dev/null" \
                    --preview-window="right:45%:wrap" \
                    --header=" aur remove — AUR-installed packages only"

        # FIX #2 + #3: capture fzf output into a variable before piping to awk
        # so fzf's exit code (130 on abort) is preserved and returned correctly.
        # The temp file is also cleaned up before returning, preventing a leak
        # when fzf aborts mid-selection.
        case flathub/install
            set -l tmp (mktemp)
            gum spin --title "  Fetching Flathub catalogue..." \
                -- sh -c "flatpak remote-ls flathub --columns=application,name > $tmp 2>/dev/null"
            set -l rows (fzf $fzf_opts \
                --preview="flatpak remote-info flathub {1} 2>/dev/null" \
                --preview-window="right:45%:wrap:hidden" \
                --header=" flathub install — TAB=multi  ctrl-/=preview" \
                < $tmp)
            set -l fzf_status $status
            rm -f $tmp
            test $fzf_status -ne 0; and return $fzf_status
            for row in $rows
                echo $row | awk '{print $1}'
            end

        case flathub/remove
            set -l rows (flatpak list --columns=application,name 2>/dev/null \
                | fzf $fzf_opts \
                    --preview="flatpak info {1} 2>/dev/null" \
                    --preview-window="right:45%:wrap" \
                    --header=" flathub remove — installed flatpaks")
            set -l fzf_status $status
            test $fzf_status -ne 0; and return $fzf_status
            for row in $rows
                echo $row | awk '{print $1}'
            end
    end
end


# ── _pkg_execute ──────────────────────────────────────────────────────────────

# FIX #4 (continued): accept -y flag and thread --noconfirm into backends
function _pkg_execute
    argparse 'y/yes' -- $argv
    or return 1

    set -l action   $argv[1]
    set -l source   $argv[2]
    set -l packages $argv[3..-1]
    set -l exit_code 0

    switch "$source/$action"

        case alpm/install
            sudo -v
            for p in $packages
                gum spin \
                    --spinner dot \
                    --title "  installing $p ..." \
                    -- sudo pacman -S --needed --noconfirm $p
                # FIX #5: on failure, emit a re-run hint so the user knows what broke
                if test $status -ne 0
                    set exit_code 1
                    gum log --level warn "failed: $p — re-run: sudo pacman -S $p"
                end
            end

        case alpm/remove
            sudo -v
            gum spin \
                --spinner dot \
                --title "  removing "(string join " " $packages)" ..." \
                -- sudo pacman -Rns --noconfirm $packages
            set exit_code $status
            test $exit_code -ne 0
                and gum log --level warn "failed — re-run: sudo pacman -Rns "(string join " " $packages)

        case aur/install
            # FIX #4: pass --noconfirm to yay when -y was given
            set -l yay_flags --needed --answerclean=None --answerdiff=None
            set -q _flag_yes; and set -a yay_flags --noconfirm
            for p in $packages
                gum spin \
                    --spinner dot \
                    --title "  installing $p (aur) ..." \
                    -- yay -S $yay_flags $p
                if test $status -ne 0
                    set exit_code 1
                    gum log --level warn "failed: $p — re-run: yay -S $p"
                end
            end

        case aur/remove
            gum spin \
                --spinner dot \
                --title "  removing "(string join " " $packages)" (aur) ..." \
                -- yay -Rns --noconfirm $packages
            set exit_code $status
            test $exit_code -ne 0
                and gum log --level warn "failed — re-run: yay -Rns "(string join " " $packages)

        case flathub/install
            for p in $packages
                gum spin \
                    --spinner dot \
                    --title "  installing $p (flathub) ..." \
                    -- flatpak install flathub $p -y --noninteractive
                if test $status -ne 0
                    set exit_code 1
                    gum log --level warn "failed: $p — re-run: flatpak install flathub $p"
                end
            end

        case flathub/remove
            for p in $packages
                gum spin \
                    --spinner dot \
                    --title "  removing $p (flathub) ..." \
                    -- flatpak remove $p -y --noninteractive
                if test $status -ne 0
                    set exit_code 1
                    gum log --level warn "failed: $p — re-run: flatpak remove $p"
                end
            end
    end

    if test $exit_code -eq 0
        gum log --level info "$action done"
    else
        gum log --level error "$action failed (exit $exit_code)"
    end

    return $exit_code
end