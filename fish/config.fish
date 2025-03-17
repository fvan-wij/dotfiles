if status is-interactive
    # Commands to run in interactive sessions can go here
    ls
    alias xclip="xclip -selection clipboard"
    set -g fish_color_scheme fairground
    set -U fish_greeting ""
    if test -f /proc/version && string match -q "*Linux*" (cat /proc/version)
        alias open="xdg-open"
    else
        alias open="explorer.exe"
    end
    abbr --add gall git add -A
    abbr --add gco git checkout
    abbr --add gcm git commit -m
    abbr --add gpo git push origin
end
