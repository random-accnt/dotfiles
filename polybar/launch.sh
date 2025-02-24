#!/usr/bin/env bash

# terminate running bars
polybar-msg cmd quit

# launch bar
echo "---" | tee -a /tmp/polybar.log
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
