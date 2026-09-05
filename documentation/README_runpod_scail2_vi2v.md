# One Click - SCAIL-2 video-to-video with subject motion control

Transfer motion from a driving video to a reference subject in ComfyUI with SCAIL-2. The diffusion model, DPO and LightX2V LoRAs, VAE, encoders, SAM, custom nodes and workflow are provisioned automatically.

## Purpose-built and cost-efficient

This template downloads only SCAIL-2 VI2V components, not the WAN 2.2 T2V, I2V/SVI or Animate packages. Separating the workloads avoids unnecessary downloads, storage use and provisioning time.

## Choose a WAN template

| Template | Choose it for |
|---|---|
| **SCAIL-2 VI2V — this template** | Guide a reference subject with motion from a driving video |
| [WAN 2.2 T2V](https://console.runpod.io/deploy?template=qvozvvb1xd&ref=se4tkc5o) | Generate video entirely from text |
| [WAN 2.2 I2V + SVI v2 PRO](https://console.runpod.io/deploy?template=moem21s8xb&ref=se4tkc5o) | Animate an image or create longer video |
| [WAN 2.2 Animate](https://console.runpod.io/deploy?template=tp7gj0khyo&ref=se4tkc5o) | Subject replacement, relighting and Animate workflows |

## Start here

1. [Deploy the SCAIL-2 VI2V template](https://console.runpod.io/deploy?template=9i0lkwau54&ref=se4tkc5o).
2. Choose FP16 for maximum quality or FP8 for a 24 GB GPU.
3. Select sufficient Pod RAM and persistent volume storage.
4. Set `PASSWORD` and any required download tokens.
5. Avoid Pods without a region; they can be unstable.
6. Deploy and follow the container logs.
7. Wait for `Provisioning done, ready to create AI content` before opening ComfyUI.
8. Load the supplied SCAIL-2 VI2V workflow and begin with a short source clip.

## Included components

- SCAIL-2 FP16 and FP8-scaled diffusion profiles.
- FP16 or FP8-scaled UMT5 text encoder.
- CLIP Vision and WAN VAE.
- LightX2V acceleration and SCAIL-2 DPO LoRAs.
- SAM 3.1 multiplex checkpoint for subject selection.
- Ready-to-use simple VI2V workflow.
- CUDA 12.8 with compiled attention and GPU acceleration.
- ComfyUI, Code Server, LoRA Manager and SSH.
- Persistent `/workspace` storage.

## Hardware profiles

| Precision | Recommended GPU | Min VRAM | Min Pod RAM |
|---|---|---:|---:|
| FP16 | L40S / RTX 6000 Ada | 48 GB | 96 GB |
| FP8 | RTX A5000 / RTX 4090 | 24 GB | 60 GB |

Requirements depend strongly on source-video length and resolution. Start with short clips before increasing either. The template reserves **75 GB volume** and **15 GB container disk**.

## Configuration

| Variable | Purpose |
|---|---|
| `PASSWORD` | Protect Code Server and pod tools |
| `HF_TOKEN` | Gated/private or rate-limited Hugging Face downloads |
| `CIVITAI_TOKEN` | CivitAI model and LoRA downloads |

Store tokens as RunPod secrets.

## Documentation and other templates

- [WAN overview](https://comfyui.rozenlaan.site/ComfyUI_WAN/)
- [WAN tutorial](https://comfyui.rozenlaan.site/ComfyUI_WAN_tutorial/)
- [Hardware guide](https://comfyui.rozenlaan.site/ComfyUI_WAN_hardware/)
- [RunPod deployment guide](https://comfyui.rozenlaan.site/Runpod_pod_deployment/)
- [T2V](https://console.runpod.io/deploy?template=qvozvvb1xd&ref=se4tkc5o) · [I2V + SVI](https://console.runpod.io/deploy?template=moem21s8xb&ref=se4tkc5o) · [Animate](https://console.runpod.io/deploy?template=tp7gj0khyo&ref=se4tkc5o)
