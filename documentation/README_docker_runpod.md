# Run WAN 2.x with ComfyUI and provisioning

## Features

- Automatic model and LoRA provisioning via environment variables.
- Supports advanced workflows for **video generation** and **enhancement** using pre-installed custom nodes.
- Compatible with high-performance NVIDIA GPUs (CUDA 12.8).
- Compiled attention and GPU acceleration.

## Built-in Authentication

- ComfyUI
- Code Server
- Hugging Face API
- CivitAI API

## Images on Docker

- If the image is **less than one day old**, it might not be tested yet or might still be updated.

## Template deployment RunPod

### Deployment/Usage information

- Tested on a L40S / RTX A6000 Ada / A40.

### Templates RunPod

- Specific models, LoRAs, and workflows for the templates are downloaded when the pod starts.

### Templates

[**👉 One-click Deploy WAN 2.2 t2v (lightx2v)**](https://console.runpod.io/deploy?template=qvozvvb1xd&ref=se4tkc5o)

[**👉 One-click Deploy WAN 2.2 i2v + SVI v2 PRO (lightx2v)**](https://console.runpod.io/deploy?template=moem21s8xb&ref=se4tkc5o)

[**👉 One-click Deploy WAN 2.2 animate (lightx2v)**](https://console.runpod.io/deploy?template=tp7gj0khyo&ref=se4tkc5o)

[**👉 One-click Deploy WAN SCAIL-2 VI2V (lightx2v)**](https://console.runpod.io/deploy?template=9i0lkwau54&ref=se4tkc5o)

### Documentation

- [Start](https://comfyui.rozenlaan.site/ComfyUI_WAN/)
- [Tutorial](https://comfyui.rozenlaan.site/ComfyUI_WAN_tutorial/)

## Hardware Requirements

### T2V-A14B or I2V-A14B (high/low)

#### **Recommended GPU**

- precision fp16
- video settings 1024x768 122 frames

| GPU          | VRAM  | RAM ComfyUI-Native/ComfyUI-WanVideoWrapper |
|--------------------------|-------|-------------------------|
| L40S, RTX 6000 Ada        | 45 GB | 90 GB/50 GB           |

#### **Recommended GPU** for SVI v2 PRO

- precision fp16
- video settings 1072x720 7 x 81 frames

| GPU          | VRAM  | RAM ComfyUI-Native/ComfyUI-WanVideoWrapper |
|--------------------------|-------|-------------------------|
| L40S         | 45 GB | minimum 95 GB           |

#### Possible GPU with limitations due to available RAM on RunPod

- precision fp16
- video settings 1024x768 81 frames (ComfyUI-WanVideoWrapper Offload 10)
- only possible with workflows based on ComfyUI-WanVideoWrapper

| GPU       | VRAM  | RAM ComfyUI-WanVideoWrapper |
|--------------------------|-------|--------------|
| A40, RTX 6000 | 45 GB | 45 GB |

### Animate

- precision fp16
- video settings 1024x768 77 chunks/Sampler

| Recommended GPU          | VRAM  | RAM   |
|--------------------------|-------|-------|
| L40S, RTX 6000 Ada       | 40 GB | 105 GB |

### SCAIL/SCAIL-2

- Precision: fp16.
- Depends on the length and size of the video.

| Recommended GPU        | Min VRAM  | Min RAM    |
|------------------------|-------|--------|
| L40S, RTX 6000 (Ada)   | 48 GB | 96 GB |

### SCAIL-2

- Precision: fp8
- Depends on the length and size of the video.

| GPU          | Min VRAM  | Min RAM |
|--------------------------|-------|-------------------------|
| RTX A5000 / RTX 4090 | 24 GB | 60 GB           |


## Other available pods

- [Image models](https://comfyui.rozenlaan.site/ComfyUI_image/)
- [LTX 2.3](https://comfyui.rozenlaan.site/ComfyUI_LTX/)
