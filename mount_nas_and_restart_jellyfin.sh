#!/bin/bash

NAS_PUBLIC="/Volumes/naspublic"
NAS_MEDIA="/Volumes/nasmedia"
JELLYFIN_PROCESS="Jellyfin"

# Check if NAS shares are missing
if ! mount | grep -q "$NAS_PUBLIC" || ! mount | grep -q "$NAS_MEDIA"; then
    echo "NAS shares are missing. Remounting..."
    open "/path/to/your.app"

    # Wait for remount (adjust time if needed)
    sleep 10

    # Ensure remount success before restarting Jellyfin
    if mount | grep -q "$NAS_PUBLIC" && mount | grep -q "$NAS_MEDIA"; then
        echo "Shares mounted. Restarting Jellyfin..."
        pkill -f "$JELLYFIN_PROCESS"
        open -a "Jellyfin"
    else
        echo "Failed to remount NAS shares."
    fi
else
    echo "Shares are already mounted. No action needed."
fi