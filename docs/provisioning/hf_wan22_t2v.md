# Manual provisioning WAN 2.2 t2v

- [ComfyUI](https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged)
- [Wan-AI](https://huggingface.co/Wan-AI)
- [GGUF](https://huggingface.co/QuantStack)
- [Kijai](https://huggingface.co/Kijai/WanVideo_comfy)
- [lightx2v](https://huggingface.co/lightx2v)
- [lightx2v distill loras](https://huggingface.co/lightx2v/Wan2.2-Distill-Loras/tree/main)
- [Fun Reward](https://huggingface.co/alibaba-pai/Wan2.2-Fun-Reward-LoRAs)

## Diffusion_models

### Standard fp16

```bash
hf download  Comfy-Org/Wan_2.2_ComfyUI_Repackaged split_files/diffusion_models/wan2.2_t2v_low_noise_14B_fp16.safetensors \
--local-dir /workspace/ComfyUI/models/diffusion_models/

hf download  Comfy-Org/Wan_2.2_ComfyUI_Repackaged split_files/diffusion_models/wan2.2_t2v_high_noise_14B_fp16.safetensors \
--local-dir /workspace/ComfyUI/models/diffusion_models/
``` 

### Lighting Dyno High

```bash 
hf download lightx2v/Wan2.2-Lightning Wan2.2-T2V-A14B-4steps-250928-dyno/Wan2.2-T2V-A14B-4steps-250928-dyno-high-lightx2v.safetensors \
--local-dir /workspace/ComfyUI/models/diffusion_models/
```

### VACE

```bash
hf download Kijai/WanVideo_comfy Fun/VACE/Wan2_2_Fun_VACE_module_A14B_HIGH_bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/diffusion_models/

hf download Kijai/WanVideo_comfy Fun/VACE/Wan2_2_Fun_VACE_module_A14B_LOW_bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/diffusion_models/
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

## Vae

### fp32

```bash
hf download Kijai/WanVideo_comfy Wan2_1_VAE_fp32.safetensors \
--local-dir /workspace/ComfyUI/models/vae/
```

### Standard

```bash
hf download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/vae/wan_2.1_vae.safetensors \
--local-dir /workspace/ComfyUI/models/vae/
```

## Loras Lightning lightx2v

### 1.0 Seko

```bash
hf download lightx2v/Wan2.2-Lightning Wan2.2-T2V-A14B-4steps-lora-rank64-Seko-V1/low_noise_model.safetensors \
--local-dir /workspace/ComfyUI/models/loras/

hf download lightx2v/Wan2.2-Lightning Wan2.2-T2V-A14B-4steps-lora-rank64-Seko-V1/high_noise_model.safetensors \
--local-dir /workspace/ComfyUI/models/loras/
```

### 1.1 Seko

```bash
hf download lightx2v/Wan2.2-Lightning Wan2.2-T2V-A14B-4steps-lora-rank64-Seko-V1.1/high_noise_model.safetensors \
--local-dir /workspace/ComfyUI/models/loras/

hf download lightx2v/Wan2.2-Lightning Wan2.2-T2V-A14B-4steps-lora-rank64-Seko-V1.1/low_noise_model.safetensors \
--local-dir /workspace/ComfyUI/models/loras/
```

### 250928

```bash
hf download lightx2v/Wan2.2-Lightning Wan2.2-T2V-A14B-4steps-lora-250928/high_noise_model.safetensors \
--local-dir /workspace/ComfyUI/models/loras/

hf download lightx2v/Wan2.2-Lightning Wan2.2-T2V-A14B-4steps-lora-250928/low_noise_model.safetensors \
--local-dir /workspace/ComfyUI/models/loras/
```

### 2.0 Seko

```bash
hf download lightx2v/Wan2.2-Lightning Wan2.2-T2V-A14B-4steps-lora-rank64-Seko-V2.0/high_noise_model.safetensors \
--local-dir /workspace/ComfyUI/models/loras/

hf download lightx2v/Wan2.2-Lightning Wan2.2-T2V-A14B-4steps-lora-rank64-Seko-V2.0/low_noise_model.safetensors \
--local-dir /workspace/ComfyUI/models/loras/
```

## Loras Lightning lightx2v distill

### 1217

```bash
hf download lightx2v/Wan2.2-Distill-Loras wan2.2_t2v_A14b_high_noise_lora_rank64_lightx2v_4step_1217.safetensors \
--local-dir /workspace/ComfyUI/models/loras/

hf download lightx2v/Wan2.2-Distill-Loras wan2.2_t2v_A14b_low_noise_lora_rank64_lightx2v_4step_1217.safetensors \
--local-dir /workspace/ComfyUI/models/loras/
```

### Step distilled

#### rank128

```bash
 hf download Kijai/WanVideo_comfy Lightx2v lightx2v_T2V_14B_cfg_step_distill_v2_lora_rank128_bf16.safetensors \
 --local-dir ComfyUI/models/loras
```

#### rank256

```bash
 hf download Kijai/WanVideo_comfy Lightx2v lightx2v_T2V_14B_cfg_step_distill_v2_lora_rank256_bf16.safetensors \
 --local-dir ComfyUI/models/loras
```

## Lora Fun Reward

```bash
hf download alibaba-pai/Wan2.2-Fun-Reward-LoRAs Wan2.2-Fun-A14B-InP-low-noise-HPS2.1.safetensors \
--local-dir /workspace/ComfyUI/models/loras/
```