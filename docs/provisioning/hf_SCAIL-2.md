# SCAIL 2 WAN2.1

- [Website](https://github.com/zai-org/SCAIL-2)
- [Huggingface](https://huggingface.co/Comfy-Org/SCAIL-2)

## Diffusion_models

### Standard fp16

```bash
hf download Comfy-Org/SCAIL-2 diffusion_models/wan2.1_14B_SCAIL_2_fp16.safetensors \
--local-dir=/workspace/ComfyUI/models/diffusion_models
```

### Scaled fp8

```bash
hf download Comfy-Org/SCAIL-2 diffusion_models/wan2.1_14B_SCAIL_2_fp8_scaled.safetensors  \
--local-dir=/workspace/ComfyUI/models/diffusion_models
```

## CLIP Text encoder

### Standard

```bash
hf download Kijai/WanVideo_comfy umt5-xxl-enc-bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/text_encoders/
```

### fp32

```bash
hf download LS110824/text_encoders wan21UMT5XxlFP32_fp32.safetensors \
--local-dir=/workspace/ComfyUI/models/text_encoders/
```

## CLIP Vision

### Standard

```bash
hf download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/clip_vision/clip_vision_h.safetensors \
--local-dir=/workspace/ComfyUI/models/clip_vision
``` 

### NSFW

```bash
hf download ricecake/wan21NSFWClipVisionH_v10 wan21NSFWClipVisionH_v10.safetensors \ 
--local-dir=/workspace/ComfyUI/models/clip_vision
```

## Vae

### Standard

```bash
hf download Kijai/WanVideo_comfy Wan2_1_VAE_bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/vae/
```

### fp32

```bash
hf download Kijai/WanVideo_comfy Wan2_1_VAE_fp32.safetensors \
--local-dir=/workspace/ComfyUI/models/vae/
```

## Lora

```bash
hf download Kijai/WanVideo_comfy Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/loras
```

## DPO-Lora

```bash
hf download Comfy-Org/SCAIL-2 loras/wan2.1_SCAIL_2_DPO_lora_bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/loras
```

