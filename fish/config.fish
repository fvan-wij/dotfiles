if status is-interactive
    # Commands on boot
    ls

    # Aliases
    alias xclip="xclip -selection clipboard"
    set -g fish_color_scheme fairground
    set -U fish_greeting ""

    # OS Dependant abbreviatoins or aliases
    if test -f /proc/version && string match -q "*Linux*" (cat /proc/version)
        alias open="xdg-open"
    else
        alias open="explorer.exe"
    end

    # Abbreviations
    abbr --add gall git add -A
    abbr --add gstatus git status
    abbr --add gco git checkout
    abbr --add gcm git commit -m
    abbr --add gpo git push origin
    abbr --add toconf cd ~/.config
end
