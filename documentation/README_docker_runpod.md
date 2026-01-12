# Run WAN 2.x with ComfyUI with provisioning

## Features

- Automatic model and LoRA provisioning via environment variables.
- Supports advanced workflows for **video generation** and **enhancement** using pre-installed custom nodes.
- Compatible with high-performance NVIDIA GPUs (CUDA 12.8).
- Compiled attentions and GPU accelerations.

## Built-in **authentication**
  
- ComfyUI
- Code Server
- HuggingFace API
- CivitAI API

## Images on Docker 

- If the image is **less then one day old** it is possible that it is not tested or will be updated.

## Template Deployment

### Deployment/Usage information

- All available templates on runpod are tested on a L40S / RTX A6000 Ada / A40.
- Avoid pods without region they are unstable.

### Runpod

- Use L40S or RTX6000 Ada as GPU.
- Specific models/loras/workflows for the templates are downloaded when the pod starts.
- See the [tutorial](https://comfyui.rozenlaan.site/ComfyUI_WAN_tutorial/) for the available features.

### Templates

[**👉 One-click Deploy on RunPod WAN 2.2 t2v (lightx2v)**](https://console.runpod.io/deploy?template=qvozvvb1xd&ref=se4tkc5o)

[**👉 One-click Deploy on RunPod WAN 2.2 i2v + SVI v2 PRO (lightx2v)**](https://console.runpod.io/deploy?template=moem21s8xb&ref=se4tkc5o)

[**👉 One-click Deploy on RunPod WAN 2.2 animate (lightx2v)**](https://console.runpod.io/deploy?template=tp7gj0khyo&ref=se4tkc5o)

[**👉 One-click Deploy on Runpod WAN SCAIL VI2V (lightx2v)**](https://console.runpod.io/deploy?template=9i0lkwau54&ref=se4tkc5o)

## Documentation

- [Start](https://comfyui.rozenlaan.site/ComfyUI_WAN/)
- [Tutorial](https://comfyui.rozenlaan.site/ComfyUI_WAN_tutorial/)

##  Hardware Requirements

### T2V-A14B or I2V-A14B (high/low) 

#### **Recommended GPU**

- precision fp16
- video settings 1024x768 122 frames

| GPU          | VRAM  | RAM ComfyUI-Native/ComfyUI-WanVideoWrapper |
|--------------------------|-------|-------------------------|
| L40S, RTX 6000 Ada        | 45Gb | 90Gb/50Gb           |

#### **Recommended GPU** for SVI v2 PRO

- precision fp16
- video settings 1072x720 7 x 81 frames

| GPU          | VRAM  | RAM ComfyUI-Native/ComfyUI-WanVideoWrapper |
|--------------------------|-------|-------------------------|
| L40S         | 45Gb | minimum 95 Gb           |

#### Possible GPU with limitations due to available ram on rupod

- precision fp16
- video settings 1024x768 81 frames (ComfyUI-WanVideoWrapper Offload 10)
- only possible with worflows based on ComfyUI-WanVideoWrapper

| GPU       | VRAM  | RAM ComfyUI-WanVideoWrapper |
|--------------------------|-------|--------------|
| A40, RTX 6000 | 45Gb | 45Gb |

### Animate

- precision fp16
- video settings 1024x768 77 chunks/Sampler

| Recommended GPU          | VRAM  | RAM   |
|--------------------------|-------|-------|
| L40S, RTX 6000 Ada       | 40Gb | 105Gb | 

### SCAIL

- precision fp16
- Depends on length and size of video.

| Recommended GPU          | VRAM  | RAM   |
|--------------------------|-------|-------|
| L40S, RTX 6000 (Ada)     | 40Gb | 105Gb | 


