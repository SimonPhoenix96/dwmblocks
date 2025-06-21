#!/bin/bash

# Test script to debug dwmblocks click detection

echo "Current status bar mapping:"
echo "Block order in config:"
echo "1. sb-rofi (signal 31)"
echo "2. sb-start-aider (signal 20)" 
echo "3. sb-volume (signal 10)"
echo "4. sb-clock (signal 1)"
echo "5. sb-nettraf (signal 16)"
echo "6. sb-blueberry (signal 32)"
echo "7. sb-internet (signal 4)"
echo "8. sb-moonphase (signal 17)"
echo

echo "Current root window status:"
xprop -root WM_NAME | sed 's/WM_NAME(STRING) = //g'
echo

echo "Status with visible characters only:"
xprop -root WM_NAME | sed 's/WM_NAME(STRING) = //g' | sed 's/\\[0-9]\{3\}//g' | tr -d '"'
echo

echo "To test clicks, use:"
echo "kill -USR1 \$(pgrep dwmblocks)"
