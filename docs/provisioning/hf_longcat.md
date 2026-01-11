# Manual provisioning Long Cat

- [Website](https://longcatvideo.org/)
- [Kijai](https://huggingface.co/Kijai/LongCat-Video_comfy)
- [Longcat](https://huggingface.co/meituan-longcat/LongCat-Video)

## Diffusion_models

### Standard fp16

```bash
hf download Kijai/LongCat-Video_comfy LongCat_TI2V_comfy_bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/diffusion_models
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

## Lora

```bash
hf download Kijai/LongCat-Video_comfy LongCat_distill_lora_alpha64_bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/loras
```
