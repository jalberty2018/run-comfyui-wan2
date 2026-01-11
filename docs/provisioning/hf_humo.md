# Manual provisioning HuMo

- [Bytedance](https://huggingface.co/bytedance-research/HuMo)
- [ComfyUI](https://huggingface.co/Comfy-Org/HuMo_ComfyUI)
- [Kijai](https://huggingface.co/Kijai/WanVideo_comfy/tree/main/Wan22-Lightning)

## Diffusion model

### fp16

```bash
hf download Comfy-Org/HuMo_ComfyUI split_files/diffusion_models/humo_17B_fp16.safetensors \
  --local-dir ComfyUI/models/diffusion_models
```

### fp8

```bash
hf download Comfy-Org/HuMo_ComfyUI split_files/diffusion_models/humo_17B_fp8_e4m3fn.safetensors \
  --local-dir ComfyUI/models/diffusion_models
```

# CLIP audio encoder

```bash
hf download Comfy-Org/HuMo_ComfyUI split_files/audio_encoders/whisper_large_v3_fp16.safetensors \
  --local-dir ComfyUI/models/audio_encoders
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

## VAE

### Standard

```bash
hf download Comfy-Org/Wan_2.2_ComfyUI_Repackaged split_files/vae/wan_2.1_vae.safetensors \
  --local-dir ComfyUI/models/vae
```

### fp32

```bash
hf download Kijai/WanVideo_comfy Wan2_1_VAE_fp32.safetensors \
--local-dir /workspace/ComfyUI/models/vae/
```

## Lora

```bash
hf download Kijai/WanVideo_comfy Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors \
  --local-dir ComfyUI/models/lightx2v
```
