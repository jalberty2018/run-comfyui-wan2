# One Click - WAN 2.2 image-to-video and long video with SVI v2 PRO

Animate images and create extended video in ComfyUI with WAN 2.2 I2V, LightX2V and Stable Video Infinity v2 PRO. Models, LoRAs, VAE, vision/text encoders, upscaler, nodes and workflows are provisioned automatically.

**Uncensored visual conditioning:** this template includes the `wan21NSFWClipVisionH` CLIP Vision model without an additional visual prompt-filtering layer. Users remain responsible for model use and generated content.

## Purpose-built and cost-efficient

This template downloads only the I2V and SVI components, not T2V, Animate or SCAIL-2. Separating the workloads avoids unnecessary downloads, storage use and provisioning time.

## Choose a WAN template

| Template | Choose it for |
|---|---|
| **WAN 2.2 I2V + SVI v2 PRO — this template** | Animate images and create longer video |
| [WAN 2.2 T2V](https://console.runpod.io/deploy?template=qvozvvb1xd&ref=se4tkc5o) | Generate video entirely from text |
| [WAN 2.2 Animate](https://console.runpod.io/deploy?template=tp7gj0khyo&ref=se4tkc5o) | Subject animation, replacement and motion transfer |
| [SCAIL-2 VI2V](https://console.runpod.io/deploy?template=9i0lkwau54&ref=se4tkc5o) | Guide a reference subject with a driving video |

## Start here

1. [Deploy the WAN 2.2 I2V + SVI template](https://console.runpod.io/deploy?template=moem21s8xb&ref=se4tkc5o).
2. Select a supported NVIDIA GPU and sufficient Pod RAM.
3. Use a persistent volume with space for models, inputs and long-video output.
4. Set `PASSWORD` and any required download tokens.
5. Avoid Pods without a region; they can be unstable.
6. Deploy and follow the container logs.
7. Wait for `Provisioning done, ready to create AI content` before opening ComfyUI.
8. Load an I2V or SVI workflow and run a small first test.

## Included workflows and components

- WAN 2.2 I2V A14B high- and low-noise models.
- LightX2V Distill and 4-step LoRAs.
- SVI v2 PRO high- and low-noise LoRAs.
- Native ComfyUI and WanVideoWrapper SVI workflows.
- PainterAdvanced, MoE scheduler and long-video workflows.
- Uncensored CLIP Vision, full-precision UMT5, WAN VAE and 4× upscaler.
- CUDA 12.8 with compiled attention and GPU acceleration.
- ComfyUI, Code Server, LoRA Manager and SSH.
- Persistent `/workspace` storage.

## Tested hardware

| Workflow | GPU | VRAM | Pod RAM | Tested output |
|---|---|---:|---:|---|
| I2V native | L40S / RTX 6000 Ada | 45 GB | 90 GB | 1024×768, 122 frames |
| I2V wrapper | L40S / RTX 6000 Ada | 45 GB | 50 GB | 1024×768, 122 frames |
| SVI v2 PRO | L40S | 45 GB | 95 GB minimum | 1072×720, 7×81 frames |

Long-video limits depend on resolution, segments and offloading. The template reserves **110 GB volume** and **15 GB container disk**.

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
- [T2V](https://console.runpod.io/deploy?template=qvozvvb1xd&ref=se4tkc5o) · [Animate](https://console.runpod.io/deploy?template=tp7gj0khyo&ref=se4tkc5o) · [SCAIL-2](https://console.runpod.io/deploy?template=9i0lkwau54&ref=se4tkc5o)
