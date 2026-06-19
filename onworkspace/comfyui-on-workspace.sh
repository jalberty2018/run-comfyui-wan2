#!/bin/bash

move_with_progress() {
    local source="$1"
    local destination="$2"
    local total_bytes
    local copied_bytes
    local percent
    local copy_pid

    total_bytes="$(du -sb "$source" | awk '{print $1}')"
    mkdir -p "$destination"

    echo "ℹ️ Moving $source to $destination"
    echo "ℹ️ Total size: $(numfmt --to=iec-i --suffix=B "$total_bytes")"

    cp -a "$source"/. "$destination"/ &
    copy_pid=$!

    while kill -0 "$copy_pid" 2>/dev/null; do
        copied_bytes="$(du -sb "$destination" 2>/dev/null | awk '{print $1}')"
        copied_bytes="${copied_bytes:-0}"

        if (( total_bytes > 0 )); then
            percent=$(( copied_bytes * 100 / total_bytes ))
            (( percent > 99 )) && percent=99
        else
            percent=100
        fi

        echo "Moving ComfyUI: ${percent}% ($(numfmt --to=iec-i --suffix=B "$copied_bytes")/$(numfmt --to=iec-i --suffix=B "$total_bytes"))"
        sleep 5
    done

    if ! wait "$copy_pid"; then
        echo "❌ Failed to copy $source to $destination; source was preserved."
        return 1
    fi

    echo "Moving ComfyUI: 100% ($(numfmt --to=iec-i --suffix=B "$total_bytes")/$(numfmt --to=iec-i --suffix=B "$total_bytes"))"
    rm -rf "$source"
    echo "✅ Move completed"
}

# Ensure we have /workspace in all scenarios
mkdir -p /workspace

if [[ ! -d /workspace/ComfyUI ]]; then
    move_with_progress /ComfyUI /workspace/ComfyUI || exit 1
    # Set permissions right for directory
    chmod -R 777 /workspace/ComfyUI/user
else
    rm -rf /ComfyUI
fi

# Linking
ln -s /workspace/ComfyUI /ComfyUI
