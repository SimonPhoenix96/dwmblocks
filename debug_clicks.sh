#!/bin/bash
# Debug script to test dwmblocks click detection

echo "=== Current dwmblocks status ==="
pkill dwmblocks; sleep 1
/home/jd/.local/src/dwmblocks/dwmblocks -p | head -1 | hexdump -C

echo "=== Current status bar order from config ==="
grep -E "^\s*\{" /home/jd/.local/src/dwmblocks/config.h | grep -v "^//" | grep -v "^\s*//" | nl

echo "=== Signal assignments ==="
grep -E "^\s*\{" /home/jd/.local/src/dwmblocks/config.h | grep -v "^//" | grep -v "^\s*//" | sed 's/.*,\s*\([0-9]*\)\s*}.*/\1/' | nl

echo "=== Testing click on blueberry (should be signal 32) ==="
# This simulates what happens when dwm detects a click
# We need to get the PID of dwmblocks and send it a SIGUSR1 with the right signal

DWMBLOCKS_PID=$(pgrep dwmblocks)
if [ -n "$DWMBLOCKS_PID" ]; then
    echo "dwmblocks PID: $DWMBLOCKS_PID"
    echo "Sending test signal 32 (blueberry) with button 1 (left click)"
    # This is what dwm would send: signal 32 in upper bits, button 1 in lower bits
    # signal_value = (32 << 8) | 1 = 8193
    python3 -c "
import signal
import os
from ctypes import cdll, c_int, Structure

# We can't easily send sigqueue from shell, so let's just test if dwmblocks is receiving signals
print('Would send signal with value:', (32 << 8) | 1)
"
else
    echo "dwmblocks not running"
fi
