# Loras to use with original models

## Pusa

- [Github](https://github.com/Yaofang-Liu/Pusa-VidGen)
- [Huggingface](https://huggingface.co/RaphaelLiu/Pusa-Wan2.2-V1)

### bf16

```bash
hf download Kijai/WanVideo_comfy Pusa/Wan22_PusaV1_lora_HIGH_resized_dynamic_avg_rank_98_bf16.safetensors \
--local-dir /workspace/ComfyUI/models/loras/

hf download Kijai/WanVideo_comfy Pusa/Wan22_PusaV1_lora_LOW_resized_dynamic_avg_rank_98_bf16.safetensors \
--local-dir /workspace/ComfyUI/models/loras/
```

### Full (10 Gb)

```bash
hf download RaphaelLiu/Pusa-Wan2.2-V1 high_noise_pusa.safetensors \ 
--local-dir=/workspace/ComfyUI/models/loras

hf download RaphaelLiu/Pusa-Wan2.2-V1 low_noise_pusa.safetensors \ 
--local-dir=/workspace/ComfyUI/models/loras
```

## Reward HPS

-[Huggingface](https://huggingface.co/alibaba-pai/Wan2.2-Fun-Reward-LoRAs)

```bash
hf download alibaba-pai/Wan2.2-Fun-Reward-LoRAs Wan2.2-Fun-A14B-InP-high-noise-HPS2.1.safetensors \
--local-dir /workspace/ComfyUI/models/loras/

hf download alibaba-pai/Wan2.2-Fun-Reward-LoRAs Wan2.2-Fun-A14B-InP-low-noise-HPS2.1.safetensors \
--local-dir /workspace/ComfyUI/models/loras/
```