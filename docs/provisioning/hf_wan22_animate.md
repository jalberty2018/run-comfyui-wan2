# Manual provisioning WAN 2.2 animate

- [ComfyUI Huggingface](https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/tree/main/split_files)
- [Wan-AI Huggingface](https://huggingface.co/Wan-AI)
- [GGUF](https://huggingface.co/QuantStack)
- [Kijai](https://huggingface.co/Kijai/WanVideo_comfy)
- [lightx2v](https://huggingface.co/lightx2v)

## Diffusion_models

### bf16

```bash
hf download Comfy-Org/Wan_2.2_ComfyUI_Repackaged split_files/diffusion_models/wan2.2_animate_14B_bf16.safetensors \
--local-dir /workspace/ComfyUI/models/diffusion_models/
```

### fp8

```bash
hf download Kijai/WanVideo_comfy_fp8_scaled Wan22Animate/Wan2_2-Animate-14B_fp8_scaled_e4m3fn_KJ_v2.safetensors \
--local-dir /workspace/ComfyUI/models/diffusion_models/
```

## CLIP Text encoder

### fp32

```bash
hf download LS110824/text_encoders wan21UMT5XxlFP32_fp32.safetensors \
--local-dir /workspace/ComfyUI/models/text_encoders/
```

### fp16

```bash
hf download Comfy-Org/Wan_2.2_ComfyUI_Repackaged split_files/text_encoders/umt5_xxl_fp16.safetensors \
--local-dir /workspace/ComfyUI/models/text_encoders/
```

## CLIP Vision

```bash
hf download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/clip_vision/clip_vision_h.safetensors \
--local-dir /workspace/ComfyUI/models/clip_vision
``` 

## Vae

### Standard

```bash
hf download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/vae/wan_2.1_vae.safetensors \
--local-dir /workspace/ComfyUI/models/vae/
```

### fp32

```bash
hf download Kijai/WanVideo_comfy Wan2_1_VAE_fp32.safetensors \
--local-dir /workspace/ComfyUI/models/vae/
```

## Loras Lighning lightx2v & relight

```bash
hf download Kijai/WanVideo_comfy Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors \
--local-dir /workspace/ComfyUI/models/loras/

hf download Comfy-Org/Wan_2.2_ComfyUI_Repackaged split_files/loras/wan2.2_animate_14B_relight_lora_bf16.safetensors \
--local-dir /workspace/ComfyUI/models/loras/
```

```bash
hf download Kijai/WanVideo_comfy LoRAs/Wan22_relight/WanAnimate_relight_lora_fp16.safetensors \
--local-dir /workspace/ComfyUI/models/loras/
```
