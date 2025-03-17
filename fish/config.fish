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

    function git_remote_to_web_url
        set git_url (git config --get remote.origin.url)

        if string match -q 'git@*' $git_url
            set web_url (echo $git_url | sed 's/git@\(.*\):\(.*\)\.git/https:\/\/\1\/\2/')

        else if string match -q 'https://*' $git_url
            set web_url (echo $git_url | sed 's/\.git$//')
        else
            set web_url $git_url
            echo "Warning: Unrecognized Git URL format. Opening original URL."
        end
        echo $web_url
    end

    function gb
        set web_url (git_remote_to_web_url)
        if test -n "$web_url"
            echo "Opening: $web_url"
            google-chrome --no-sandbox $web_url
        else
            echo "Error: Could not determine repository URL. Are you in a Git repository?"
        end
    end

    # Abbreviations
    abbr --add gall git add -A
    abbr --add gstatus git status
    abbr --add gco git checkout
    abbr --add gcm git commit -m
    abbr --add gpo git push origin
end
