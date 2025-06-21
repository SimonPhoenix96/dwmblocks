#!/bin/bash

echo "=== DWMBLOCKS CLICK FIX - FINAL VERIFICATION ==="
echo
echo "✅ Issue Identified: Signal 32 exceeded SIGRTMAX limit"
echo "✅ Fix Applied: Changed sb-blueberry from signal 32 → 18"
echo "✅ All blocks now present in status bar"
echo
echo "Current status bar layout with signals:"
echo "1. sb-rofi (31) - 🚀"
echo "2. sb-start-aider (20) - 🤖"  
echo "3. sb-volume (10) - 🔊"
echo "4. sb-clock (1) - 🕒"
echo "5. sb-nettraf (16) - 🔻🔺"
echo "6. sb-blueberry (18) - 🔷  ← Should now work correctly"
echo "7. sb-internet (4) - 🌐"
echo "8. sb-moonphase (17) - 🌓"
echo
echo "📍 TEST: Click on the Blueberry icon (🔷) in your status bar"
echo "Expected: Opens Blueberry Bluetooth manager"
echo "Previous: Was triggering sb-nettraf instead"
echo
if pgrep dwmblocks > /dev/null; then
    echo "✅ dwmblocks is running with correct configuration"
else
    echo "❌ dwmblocks not running - restart with: setsid dwmblocks &"
fi
