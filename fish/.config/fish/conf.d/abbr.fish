# ── eza / ls ──────────────────────────────────────────────
abbr --add ls 'eza --icons --color=always'
abbr --add lla 'eza -lgaoh --icons --git'
abbr --add ll 'eza -lgoh --icons --git'
abbr --add lf 'eza -goh --icons --only-files --show-symlinks --git'
abbr --add ldir 'eza -goh --icons --only-dirs --show-symlinks --git'
abbr --add laf 'eza -gaoh --icons --only-files --show-symlinks --git'
abbr --add ladir 'eza -gaoh --icons --only-dirs --show-symlinks --git'
abbr --add llaf 'eza -lgaoh --icons --only-files --show-symlinks --git'
abbr --add lladir 'eza -lgaoh --icons --only-dirs --show-symlinks --git'
abbr --add llf 'eza -lgoh --icons --only-files --show-symlinks --git'
abbr --add lldir 'eza -lgoh --icons --only-dirs --show-symlinks --git'
abbr --add la 'eza -ah --icons --color=always'
abbr --add lt 'eza --tree --icons --git'


# ── Navigation ────────────────────────────────────────────
abbr --add home 'cd ~'
abbr --add .. 'cd ..'
abbr --add ... 'cd ../..'
abbr --add .... 'cd ../../..'

# ── chmod ─────────────────────────────────────────────────
abbr --add mx 'chmod a+x'
abbr --add 000 'chmod 000'
abbr --add 644 'chmod 644'
abbr --add 666 'chmod 666'
abbr --add 755 'chmod 755'
abbr --add 777 'chmod 777'
abbr --add 000r 'chmod -R 000'
abbr --add 644r 'chmod -R 644'
abbr --add 666r 'chmod -R 666'
abbr --add 755r 'chmod -R 755'
abbr --add 777r 'chmod -R 777'

# ── Core utils ────────────────────────────────────────────
abbr --add snano 'sudo nano'
abbr --add cp 'cp -rv'
abbr --add mv 'mv -v'
abbr --add rm 'rm -frv'
abbr --add sucp 'sudo cp -rv'
abbr --add sumv 'sudo mv -v'
abbr --add surm 'sudo rm -frv'
abbr --add mkdir 'mkdir -p'
abbr --add ping 'ping -c 10'
abbr --add less 'less -R'
abbr --add cls clear
abbr --add vim nvim
abbr --add vi nvim
abbr --add lg lazygit
abbr --add linutil 'curl -fsSL https://christitus.com/linux | sh'
