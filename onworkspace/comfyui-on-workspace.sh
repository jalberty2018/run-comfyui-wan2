#!/bin/bash

# Ensure we have /workspace in all scenarios
mkdir -p /workspace

if [[ ! -d /workspace/ComfyUI ]]; then
	mv /ComfyUI /workspace
	# Set permissions right for directory
    chmod -R 777 /workspace/ComfyUI/user
else
	rm -rf /ComfyUI
fi

# Linking
ln -s /workspace/ComfyUI /ComfyUI
