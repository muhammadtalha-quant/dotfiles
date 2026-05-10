complete -c uncompress -s h -l help    -f -d 'Show usage'
complete -c uncompress -s v -l verbose -f -d 'Show files as they are extracted'
complete -c uncompress -f -k \
    -a "(find . -maxdepth 1 \
        -name '*.tar'      -o \
        -name '*.tar.gz'   -o \
        -name '*.tgz'      -o \
        -name '*.tar.bz2'  -o \
        -name '*.tar.xz'   -o \
        -name '*.tar.zst'  -o \
        -name '*.gz'       -o \
        -name '*.bz2'      -o \
        -name '*.zip'      -o \
        -name '*.7z'       -o \
        -name '*.rar'      \
        2>/dev/null | sed 's|^\./||')"