#!/bin/sh
# Guaranteed immediate shutdown script


# POSIX-compliant guaranteed system shutdown
# Run as root or via sudo (NOPASSWD)

# Disable any power inhibitors (optional, safer than immediate kill)
# Try graceful shutdown first, then escalate to force, then kernel-level poweroff.
#
LOGFILE="/var/log/force-poweroff.log"

# Write a log message safely
log() {
    # If /var/log not writable (e.g., read-only during shutdown), fallback to /tmp
    if [ ! -w "$(dirname "$LOGFILE")" ]; then
        LOGFILE="/tmp/poweroff.log"
    fi
    # Use printf for POSIX compliance, append timestamp
    printf '%s %s\n' "$(date '+%F %T')" "$1" >> "$LOGFILE" 2>/dev/null
	sleep 1
}

# Try systemd poweroff (graceful)
if command -v systemctl >/dev/null 2>&1; then
	log "[graceful] systemctl poweroff -i --force"
    systemctl poweroff -i --force && exit 0
fi

# Fallback to traditional poweroff
if command -v /sbin/poweroff >/dev/null 2>&1; then
	log "[fallback] using /sbin/poweroff -f"
    /sbin/poweroff -f && exit 0
fi

log "going for harmfull poweroff"

# Kernel-level last resort (bypasses everything)
if [ -w /proc/sysrq-trigger ]; then
	log "[kernel-level] triggering SysRq immediate poweroff"
    echo 1 > /proc/sys/kernel/sysrq 2>/dev/null
    echo o > /proc/sysrq-trigger 2>/dev/null
fi

log "[error] all poweroff methods failed"

exit 0


