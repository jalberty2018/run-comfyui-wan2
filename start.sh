#!/bin/bash
echo "▶️ Pod run-comfyui-wan2 started"
echo "ℹ️ Wait until the message 🎉 Provisioning done, ready to create AI content 🎉 is displayed"

# Enable SSH if PUBLIC_KEY is set
if [[ -n "$PUBLIC_KEY" ]]; then
    mkdir -p ~/.ssh && chmod 700 ~/.ssh
    echo "$PUBLIC_KEY" >> ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    service ssh start
    echo "✅ [SSH enabled]"
fi

# Export env variables
if [[ -n "${RUNPOD_GPU_COUNT:-}" ]]; then
   echo "ℹ️ Exporting runpod.io environment variables..."
   printenv | grep -E '^RUNPOD_|^PATH=|^_=' \
     | awk -F = '{ print "export " $1 "=\"" $2 "\"" }' >> /etc/rp_environment

   echo 'source /etc/rp_environment' >> ~/.bashrc
fi

# Move necessary files to workspace
echo "ℹ️ [Moving necessary files to workspace] enabling rebooting pod without data loss"
for script in comfyui-on-workspace.sh files-on-workspace.sh test-on-workspace.sh docs-on-workspace.sh; do
    if [ -f "/$script" ]; then
        echo "Executing $script..."
        "/$script"
    else
        echo "⚠️ WARNING: Skipping $script (not found)"
    fi
done

# Create output directory for cloud transfer
mkdir -p /workspace/output/

# Set optimizations
export PYTORCH_ALLOC_CONF=expandable_segments:True,garbage_collection_threshold:0.8
export COMFYUI_VRAM_MODE=HIGH_VRAM

# GPU detection
echo "ℹ️ Testing GPU/CUDA provisioning"

# GPU detection Runpod.io
HAS_GPU_RUNPOD=0
if [[ -n "${RUNPOD_GPU_COUNT:-}" && "${RUNPOD_GPU_COUNT:-0}" -gt 0 ]]; then
  HAS_GPU_RUNPOD=1
  echo "✅ [GPU DETECTED] Found via RUNPOD_GPU_COUNT=${RUNPOD_GPU_COUNT}"
else
  echo "⚠️ [NO GPU] No Runpod.io GPU detected."
fi  

# GPU detection nvidia-smi
HAS_GPU=0
if command -v nvidia-smi >/dev/null 2>&1; then
  if nvidia-smi >/dev/null 2>&1; then
    HAS_GPU=1
    GPU_MODEL=$(nvidia-smi --query-gpu=name --format=csv,noheader | xargs | sed 's/,/, /g')
    echo "✅ [GPU DETECTED] Found via nvidia-smi → Model(s): ${GPU_MODEL}"
  else
    echo "⚠️ [NO GPU] nvidia-smi found but failed to run (driver or permission issue)"
  fi
else
  echo "⚠️ [NO GPU] No GPU found via nvidia-smi"
fi

# Start code-server (HTTP port 9000) 
if [[ "$HAS_GPU" -eq 1 || "$HAS_GPU_RUNPOD" -eq 1 ]]; then    
    echo "▶️ Code-Server service starting"
	
    if [[ -n "$PASSWORD" ]]; then
        code-server /workspace --auth password --disable-update-check --disable-telemetry --host 0.0.0.0 --bind-addr 0.0.0.0:9000 &
    else
        echo "⚠️ PASSWORD is not set as an environment. Password file: /root/.config/code-server/config.yaml"
        code-server /workspace --disable-telemetry --disable-update-check --host 0.0.0.0 --bind-addr 0.0.0.0:9000 &
    fi
	
    echo "🎉 code-server service started"
else
    echo "⚠️ WARNING: No GPU available, Code Server not started to limit memory use"
fi
	
sleep 2

# Python, Torch CUDA check
HAS_CUDA=0
if command -v python >/dev/null 2>&1; then
  if python - << 'PY' >/dev/null 2>&1
import sys
try:
    import torch
    sys.exit(0 if torch.cuda.is_available() else 1)
except Exception:
    sys.exit(1)
PY
  then
    HAS_CUDA=1
  fi
else
  echo "⚠️ Python not found – assuming no CUDA"
fi

# Start ComfyUI (HTTP port 8188)
HAS_COMFYUI=0

if [[ "$HAS_CUDA" -eq 1 ]]; then  	
   	echo "▶️ ComfyUI service starting (CUDA available)"
	    
    python3 /workspace/ComfyUI/main.py ${COMFYUI_EXTRA_ARGUMENTS:---listen --enable-manager --preview-method latent2rgb} &

    # Wait until ComfyUI is ready
    MAX_TRIES=40
    COUNT=0
		
    until curl -s http://127.0.0.1:8188 > /dev/null; do
        COUNT=$((COUNT+1))

        if [[ $COUNT -ge $MAX_TRIES ]]; then
            echo "⚠️  WARNING: ComfyUI is still not responding after $MAX_TRIES attempts (~1 min)."
            echo "⚠️  Continuing script anyway..."
            break
        fi

        echo "ℹ️ Waiting for ComfyUI to come online... ($COUNT/$MAX_TRIES)"
        sleep 5
    done

    # Success message only when ComfyUI responded
    if curl -s http://127.0.0.1:8188 > /dev/null; then
        HAS_COMFYUI=1
        echo "🎉 ComfyUI is online!"
    fi
else
    echo "❌ ERROR: PyTorch CUDA driver mismatch or unavailable, ComfyUI not started"
fi

# Function to download models if variables are set
download_model_HF() {
    local model_var="$1"
    local file_var="$2"
    local dest_dir="$3"
	
    if [[ -n "${!model_var}" && -n "${!file_var}" ]]; then		
        local target="/workspace/ComfyUI/models/$dest_dir"
        mkdir -p "$target"
        echo "ℹ️ [DOWNLOAD] Fetching ${!model_var}/${!file_var} → $target"
        hf download "${!model_var}" "${!file_var}" --local-dir "$target" || \
            echo "⚠️ Failed to download ${!model_var}/${!file_var}"
        sleep 1
    fi

    return 0
}

download_generic_HF() {
    local model_var="$1"
    local file_var="$2"
    local dest_dir="$3"

    local model="${!model_var}"
    [[ -z "$model" ]] && return 0

    local file=""
    if [[ -n "$file_var" ]]; then
        file="${!file_var}"
    fi

    local target="/workspace/ComfyUI/$dest_dir"
    mkdir -p "$target"

    if [[ -n "$file" ]]; then
        echo "ℹ️ [DOWNLOAD] Fetching $model/$file → $target"
        hf download "$model" "$file" --local-dir "$target" || \
            echo "⚠️ Failed to download $model/$file"
    else
        echo "ℹ️ [DOWNLOAD] Fetching $model → $target"
        hf download "$model" --local-dir "$target" || \
            echo "⚠️ Failed to download $model"
    fi

    sleep 1
    return 0
}

download_model_CIVITAI() {
    local url_var="$1"
    local dest_dir="$2"

    # Geen URL → niets doen
    if [[ -z "${!url_var}" ]]; then
        return 0
    fi

    # Token check
    if [[ -z "$CIVITAI_TOKEN" ]]; then
        echo "⚠️ ERROR: CIVITAI_TOKEN is not set as an environment variable – '${!url_var}' not downloaded"
        return 1
    fi

    local target="/workspace/ComfyUI/models/$dest_dir"
    mkdir -p "$target"

    local url="${!url_var}"

    # Probeer bestandsnaam te bepalen
    local filename
    filename="$(basename "$(printf '%s\n' "$url" | sed 's/[?#].*$//')")"

    # Fallback: onbekende naam (bij API download)
    if [[ "$filename" == "download" || "$filename" == "models" || -z "$filename" ]]; then
        filename=""
    fi

    # Bestaat het bestand al?
    if [[ -n "$filename" ]] && compgen -G "$target/$filename*" > /dev/null; then
        echo "✅ [SKIP] $filename already exists in $target"
        return 0
    fi

    echo "ℹ️ [DOWNLOAD] Fetching $url → $target ..."
    civitai --quit "$url" "$target" || {
        echo "⚠️ Failed to download $url"
        return 1
    }

    sleep 1
    return 0
}

download_workflow() {
    local url_var="$1"

    # Check if URL variable is set and not empty
    if [[ -z "${!url_var}" ]]; then
        return 0
    fi

    # Destination directory
    local dest_dir="/workspace/ComfyUI/user/default/workflows/"
    mkdir -p "$dest_dir"

    # Get filename from URL
    local url="${!url_var}"
    local filename
    filename=$(basename "$url")
    local filepath="${dest_dir}${filename}"

    # Skip entire process if file already exists
    if [[ -f "$filepath" ]]; then
        echo "⏭️  [SKIP] $filename already exists — skipping download and extraction"
        return 0
    fi

    # Download file
    echo "ℹ️ [DOWNLOAD] Fetching $filename ..."
    if wget -q -P "$dest_dir" "$url"; then
        echo "[DONE] Downloaded $filename"
    else
        echo "⚠️  Failed to download $url"
        return 0
    fi

    # Automatically extract common archive formats
    case "$filename" in
        *.zip)
            echo "📦  [EXTRACT] Unzipping $filename ..."
            if unzip -o "$filepath" -d "$dest_dir" >/dev/null 2>&1; then
                echo "[DONE] Extracted $filename"
            else
                echo "⚠️  Failed to unzip $filename"
            fi
            ;;
        *.tar.gz|*.tgz)
            echo "📦  [EXTRACT] Extracting $filename (tar.gz) ..."
            if tar -xzf "$filepath" -C "$dest_dir"; then
                echo "[DONE] Extracted $filename"
            else
                echo "⚠️  Failed to extract $filename"
            fi
            ;;
        *.tar.xz)
            echo "📦  [EXTRACT] Extracting $filename (tar.xz) ..."
            if tar -xJf "$filepath" -C "$dest_dir"; then
                echo "[DONE] Extracted $filename"
            else
                echo "⚠️  Failed to extract $filename"
            fi
            ;;
        *.tar.bz2)
            echo "📦  [EXTRACT] Extracting $filename (tar.bz2) ..."
            if tar -xjf "$filepath" -C "$dest_dir"; then
                echo "[DONE] Extracted $filename"
            else
                echo "⚠️  Failed to extract $filename"
            fi
            ;;
        *.7z)
            echo "📦  [EXTRACT] Extracting $filename (7z) ..."
            if 7z x -y -o"$dest_dir" "$filepath" >/dev/null 2>&1; then
                echo "[DONE] Extracted $filename"
            else
                echo "⚠️  Failed to extract $filename"
            fi
            ;;
        *)
            echo "[INFO] No extraction needed for $filename"
            ;;
    esac

    sleep 1
    return 0
}

# Provisioning if comfyUI is responding running on GPU with CUDA
if [[ "$HAS_COMFYUI" -eq 1 ]]; then  
    # provisioning workflows
    echo "📥 Provisioning workflows"
	
    for i in $(seq 1 50); do
        VAR="WORKFLOW${i}"
        download_workflow "$VAR"
    done
	
    # provisioning Models and loras
    echo "📥 Provisioning models HF"
	
    # categorie:  NAME:SUFFIX:MAP
    CATEGORIES_HF=(
      "VAE:VAE_FILENAME:vae"
      "UPSCALER:UPSCALER_PTH:upscale_models"
      "LORA:LORA_FILENAME:loras"
      "TEXT_ENCODERS:TEXT_ENCODERS_FILENAME:text_encoders"
      "CLIP_VISION:CLIP_VISION_FILENAME:clip_vision"
      "PATCHES:PATCHES_FILENAME:model_patches"
      "AUDIO_ENCODERS:AUDIO_ENCODERS_FILENAME:audio_encoders"
      "DIFFUSION_MODELS:DIFFUSION_MODELS_FILENAME:diffusion_models"
      "CHECKPOINTS:CHECKPOINTS_FILENAME:checkpoints"
      "VL:VL_FILENAME:VLM"
      "SAMS:SAMS_FILENAME:sams"
      "LATENT_UPSCALE:LATENT_UPSCALE_FILENAME:latent_upscale_models"
    )
	
    for cat in "${CATEGORIES_HF[@]}"; do
      IFS=":" read -r NAME SUFFIX DIR <<< "$cat"
	
      for i in $(seq 1 20); do
        VAR1="HF_MODEL_${NAME}${i}"
        VAR2="HF_MODEL_${SUFFIX}${i}"
        download_model_HF "$VAR1" "$VAR2" "$DIR"
      done
    done
	
    # Huggingface download file to specified directory
    for i in $(seq 1 20); do
        VAR1="HF_MODEL${i}"
        VAR2="HF_MODEL_FILENAME${i}"
        DIR_VAR="HF_MODEL_DIR${i}"
        download_generic_HF "${VAR1}" "${VAR2}" "${!DIR_VAR}"
    done
	
    # Huggingface download full model to specified directory
    for i in $(seq 1 20); do
        VAR1="HF_FULL_MODEL${i}"
        DIR_VAR="HF_MODEL_DIR${i}"
        download_generic_HF "${VAR1}" "" "${!DIR_VAR}"
    done  
	 
    # provisioning Models and loras CIVITAI
    echo "📥 Provisioning models CIVITAI"
	
    # categorie: NAME:MAP	
    CATEGORIES_CIVITAI=(
       "LORA_URL:loras"
	   "UNET_URL:diffusion_models"
    )
	
    for cat in "${CATEGORIES_CIVITAI[@]}"; do
      IFS=":" read -r NAME DIR <<< "$cat"
	
      for i in $(seq 1 50); do
        VAR1="CIVITAI_MODEL_${NAME}${i}"
        download_model_CIVITAI "$VAR1" "$DIR"
      done
    done
	
    HAS_PROVISIONING=1
else
    HAS_PROVISIONING=0   
    echo "⚠️ Skipped Provisioning: No workflows or models downloaded as ComfyUI is not online"
fi

# Environment
echo "ℹ️ Running environment"

python - <<'PY'
import platform

# Safe imports – don't explode if something is missing
try:
    import torch
except Exception as e:
    print(f"PyTorch import error: {e}")
    torch = None

try:
    import triton
except Exception:
    triton = None

try:
    import onnxruntime as ort
except Exception:
    ort = None

print(f"Python: {platform.python_version()}")

if torch is not None:
    print(f"PyTorch: {torch.__version__}")
    print(f"CUDA available: {torch.cuda.is_available()}")
    if torch.cuda.is_available():
        print(f"  ↳ CUDA runtime: {torch.version.cuda}")
        print(f"  ↳ GPU(s): {[torch.cuda.get_device_name(i) for i in range(torch.cuda.device_count())]}")
        try:
            import torch.backends.cudnn as cudnn
            print(f"  ↳ cuDNN: {cudnn.version()}")
        except Exception:
            pass
    print("Torch build info:")
    try:
        torch.__config__.show()
    except Exception:
        pass
else:
    print("PyTorch: not available")

if triton is not None:
    print(f"Triton version: {triton.__version__}")
else:
    print("Triton: not available")

if ort is not None:
    print(f"ONNX Runtime version: {ort.__version__}")
    providers = ort.get_available_providers()
    print(f"Available providers: {providers}")
    print(f"CUDA provider available: {'CUDAExecutionProvider' in providers}")
else:
    print("ONNX Runtime: not available")
PY

python - <<'PY'
import llama_cpp
print("llama-cpp-python version:", llama_cpp.__version__)
try:
    from llama_cpp import llama_print_system_info
    info = llama_print_system_info()
    print(info.decode('utf-8'))
except Exception as e2:
    print("Failed:", e2)
PY

if [[ "$HAS_PROVISIONING" -eq 1 ]]; then 
    echo "🎉 Provisioning done, ready to create AI content 🎉"
		
	if [[ "$HAS_GPU_RUNPOD" -eq 1 ]]; then
	  echo "ℹ️ Connect to the following services from console menu or url"
	
	  if [[ -z "${RUNPOD_POD_ID:-}" ]]; then
	    echo "⚠️ RUNPOD_POD_ID not set — service URLs unavailable"
	  else
	    declare -A SERVICES=(
	      ["Code-Server"]=9000
	      ["ComfyUI"]=8188
	    )
	
	    # Local health checks (inside the pod)
	    for service in "${!SERVICES[@]}"; do
	      port="${SERVICES[$service]}"
	      url="https://${RUNPOD_POD_ID}-${port}.proxy.runpod.net/"
	      local_url="http://127.0.0.1:${port}/"
	
	      echo "👉 🔗 Service ${service} : ${url}"
	
	      # Check service locally (no proxy dependency)
	      http_code="$(curl -sS -o /dev/null -m 2 --connect-timeout 1 -w "%{http_code}" "$local_url" || true)"
	
	      # Treat common “service is up but protected/redirect” codes as UP
	      if [[ "$http_code" =~ ^(200|301|302|401|403|404)$ ]]; then
	        echo "✅ ${service} is running (local ${local_url}, HTTP ${http_code})"
	      else
	        echo "❌ ${service} not responding yet (local ${local_url}, HTTP ${http_code})"
	      fi
	    done
	  fi
	fi
	
    if [[ -n "$PASSWORD" ]]; then
		echo "ℹ️ Code-Server login use PASSWORD set as env"
	else 
        echo "⚠️ Code-Server login use the logged password"
		cat /root/.config/code-server/config.yaml        
    fi	
else
    echo "ℹ️ Running error diagnosis"

    if [[ "$HAS_GPU_RUNPOD" -eq 0 ]]; then
        echo "⚠️ Pod started without a runpod GPU"
    fi

    if [[ "$HAS_CUDA" -eq 0 ]]; then
        echo "❌ Pytorch CUDA driver error/mismatch/not available"
        if [[ "$HAS_GPU_RUNPOD" -eq 1 ]]; then
            echo "⚠️ [SOLUTION] Deploy pod on another region then $RUNPOD_DC_ID ⚠️"
        fi
    fi

    if [[ "$HAS_CUDA" -eq 1 && "$HAS_COMFYUI" -eq 0 ]]; then
        echo "❌ ComfyUI is not online"
        echo "⚠️ [SOLUTION] restart pod ⚠️"
    fi
fi

# Keep the container running
echo "ℹ️ End script"
exec sleep infinity