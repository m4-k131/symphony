#!/bin/bash
# Signal TUI - reload CSS on theme change
pgrep -f "signal_tui" >/dev/null 2>&1 && pkill -SIGUSR1 -f "signal_tui" || exit 0
