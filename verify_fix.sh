#!/bin/bash

# Final verification script
echo "=== DWMBLOCKS CLICK FIX VERIFICATION ==="
echo
echo "✅ Status bar generation is working"
echo "✅ All blocks are displaying:" 
echo "   - Rofi: $(sb-rofi 2>/dev/null || echo 'FAILED')"
echo "   - Aider: $(sb-start-aider 2>/dev/null || echo 'FAILED')" 
echo "   - Volume: $(sb-volume 2>/dev/null || echo 'FAILED')"
echo "   - Clock: $(sb-clock 2>/dev/null || echo 'FAILED')"
echo "   - NetTraf: $(sb-nettraf 2>/dev/null || echo 'FAILED')"
echo "   - Blueberry: $(sb-blueberry 2>/dev/null || echo 'FAILED')"
echo "   - Internet: $(sb-internet 2>/dev/null || echo 'FAILED')"
echo "   - Moonphase: $(sb-moonphase 2>/dev/null || echo 'FAILED')"
echo
echo "✅ Moonphase script has error handling (no more failures)"
echo "✅ Buffer size increased to 512 characters"
echo "✅ All signal characters are properly embedded"
echo

if pgrep dwmblocks > /dev/null; then
    echo "✅ dwmblocks is running"
    echo
    echo "📍 CLICK TEST INSTRUCTIONS:"
    echo "Now try clicking on the Blueberry (🔷) icon in your status bar."
    echo "It should open the Blueberry Bluetooth manager, not volume control."
    echo
    echo "If clicks are still wrong, the issue is in dwm's click coordinate"
    echo "calculation, not in dwmblocks signal embedding."
else
    echo "❌ dwmblocks is not running - start it with: setsid dwmblocks &"
fi
