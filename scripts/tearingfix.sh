#!/bin/sh

#profile file to supress tearing with nvidia drivers
#nvidia-settings --assign CurrentMetaMode="$(xrandr | sed -nr '/(\S+) connected (primary )?[0-9]+x[0-9]+(\+\S+).*/{ s//\1: nvidia-auto-select \3 { ForceFullCompositionPipeline = On }, /; H }; ${ g; s/\n//g; s/, $//; p }')"
nvidia-settings --assign CurrentMetaMode="DVI-D-0: nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }, HDMI-0: nvidia-auto-select +2560+180 { ForceFullCompositionPipeline = On }, DVI-D-1: 1920x1080 +2560+180 { ForceFullCompositionPipeline = On }"

echo "$(xrandr | sed -nr '/(\S+) connected (primary )?[0-9]+x[0-9]+(\+\S+).*/{ s//\1: nvidia-auto-select \3 { ForceFullCompositionPipeline = On }, /; H }; ${ g; s/\n//g; s/, $//; p }')" 
