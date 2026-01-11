# Lucy edit

- [DecartAI](https://huggingface.co/decart-ai/Lucy-Edit-Dev)

## Diffusion mode

### fp16

```bash
hf download decart-ai/Lucy-Edit-Dev-ComfyUI lucy-edit-dev-cui-fp16.safetensors \
--local-dir /workspace/ComfyUI/models/diffusion_models/
```

### fp32

```bash
hf download decart-ai/Lucy-Edit-Dev-ComfyUI lucy-edit-dev-cui.safetensors \
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

### fp8

hf download Comfy-Org/Wan_2.2_ComfyUI_Repackaged split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors \
--local-dir /workspace/ComfyUI/models/text_encoders/

## VAE encoder/decoder

```bash
hf download Comfy-Org/Wan_2.2_ComfyUI_Repackaged split_files/vae/wan2.2_vae.safetensors \
--local-dir /workspace/ComfyUI/models/vae/
```
