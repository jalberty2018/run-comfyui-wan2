# Manual provisioning Wan Animate 2

- [Comfy-Org Wan Animate 2](https://huggingface.co/Comfy-Org/Wan-Animate-2/tree/main)
- [Original Wan-AI model](https://huggingface.co/Wan-AI/Wan2.2-Animate-2-14B)

The profiles below deliberately use the non-distilled diffusion models. Both
profiles include the accompanying CLIP Vision model, text encoder, VAE and
LightX2V LoRA from the Comfy-Org repository.

## HVRAM (L40S, 48 GB)

```bash
hf download Comfy-Org/Wan-Animate-2 diffusion_models/wan_animate_2_bf16.safetensors \
  --local-dir /workspace/ComfyUI/models/diffusion_models/

hf download Comfy-Org/Wan-Animate-2 clip_vision/clip_vision_h.safetensors \
  --local-dir /workspace/ComfyUI/models/clip_vision/

hf download Comfy-Org/Wan-Animate-2 text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors \
  --local-dir /workspace/ComfyUI/models/text_encoders/

hf download Comfy-Org/Wan-Animate-2 vae/Wan2_1_VAE_bf16.safetensors \
  --local-dir /workspace/ComfyUI/models/vae/

hf download Comfy-Org/Wan-Animate-2 loras/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors \
  --local-dir /workspace/ComfyUI/models/loras/
```

## LVRAM (RTX 5090, 32 GB)

The LVRAM profile uses the non-distilled INT8 ConvRot checkpoint. The support
models and LoRA are identical to the HVRAM profile.

```bash
hf download Comfy-Org/Wan-Animate-2 diffusion_models/wan_animate_2_int8_convrot.safetensors \
  --local-dir /workspace/ComfyUI/models/diffusion_models/

hf download Comfy-Org/Wan-Animate-2 clip_vision/clip_vision_h.safetensors \
  --local-dir /workspace/ComfyUI/models/clip_vision/

hf download Comfy-Org/Wan-Animate-2 text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors \
  --local-dir /workspace/ComfyUI/models/text_encoders/

hf download Comfy-Org/Wan-Animate-2 vae/Wan2_1_VAE_bf16.safetensors \
  --local-dir /workspace/ComfyUI/models/vae/

hf download Comfy-Org/Wan-Animate-2 loras/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors \
  --local-dir /workspace/ComfyUI/models/loras/
```
