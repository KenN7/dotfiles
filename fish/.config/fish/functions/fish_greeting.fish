function fish_greeting
    if type -q figlet; and type -q lolcat
        hostname | figlet | lolcat -F 0.3
    else if type -q figlet
        hostname | figlet
    else
        echo ">>>>>>"
        hostname
        echo "<<<<<<"
    end
    uptime
end
