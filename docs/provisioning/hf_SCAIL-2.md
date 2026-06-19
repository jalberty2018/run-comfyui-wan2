# SCAIL-2 WAN 2.1

## References

- [SCAIL-2 project](https://github.com/zai-org/SCAIL-2)
- [SCAIL-2 models](https://huggingface.co/Comfy-Org/SCAIL-2)
- [Wan 2.1 ComfyUI repack](https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged)
- [Kijai WanVideo models](https://huggingface.co/Kijai/WanVideo_comfy)
- [SAM3.1 ComfyUI checkpoint](https://huggingface.co/Comfy-Org/sam3.1)

## Manual provisioning

### Diffusion model

#### 8-bit scaled FP8

```bash
hf download Comfy-Org/SCAIL-2 diffusion_models/wan2.1_14B_SCAIL_2_fp8_scaled.safetensors \
--local-dir=/workspace/ComfyUI/models/diffusion_models
```

#### 16-bit FP16

```bash
hf download Comfy-Org/SCAIL-2 diffusion_models/wan2.1_14B_SCAIL_2_fp16.safetensors \
--local-dir=/workspace/ComfyUI/models/diffusion_models
```

### CLIP text encoder

#### 8-bit scaled FP8

```bash
hf download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors \
--local-dir=/workspace/ComfyUI/models/text_encoders
```

#### 16-bit FP16

```bash
hf download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/text_encoders/umt5_xxl_fp16.safetensors \
--local-dir=/workspace/ComfyUI/models/text_encoders
```

### CLIP Vision

```bash
hf download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/clip_vision/clip_vision_h.safetensors \
--local-dir=/workspace/ComfyUI/models/clip_vision
```

### VAE

```bash
hf download Kijai/WanVideo_comfy Wan2_1_VAE_bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/vae
```

### LightX2V LoRA

```bash
hf download Kijai/WanVideo_comfy Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank128_bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/loras
```

### SCAIL-2 DPO LoRA

```bash
hf download Comfy-Org/SCAIL-2 loras/wan2.1_SCAIL_2_DPO_lora_bf16.safetensors \
--local-dir=/workspace/ComfyUI/models/loras
```

### SAM3.1 checkpoint

```bash
hf download Comfy-Org/sam3.1 checkpoints/sam3.1_multiplex_fp16.safetensors \
--local-dir=/workspace/ComfyUI/models/checkpoints
```
