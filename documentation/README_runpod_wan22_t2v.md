# One Click - WAN 2.2 text-to-video with LightX2V

Generate video from text in ComfyUI with WAN 2.2 A14B. The high- and low-noise models, VAE, text encoder, acceleration LoRAs, upscaler, custom nodes and workflows are provisioned automatically.

## Purpose-built and cost-efficient

This template downloads only the WAN 2.2 T2V components, not I2V/SVI, Animate or SCAIL-2. Separating the workloads avoids unnecessary downloads, storage use and provisioning time.

## Choose a WAN template

| Template | Choose it for |
|---|---|
| **WAN 2.2 T2V — this template** | Generate video entirely from a text prompt |
| [WAN 2.2 I2V + SVI v2 PRO](https://console.runpod.io/deploy?template=moem21s8xb&ref=se4tkc5o) | Animate an image or create longer video |
| [WAN 2.2 Animate](https://console.runpod.io/deploy?template=tp7gj0khyo&ref=se4tkc5o) | Subject animation, replacement and motion transfer |
| [SCAIL-2 VI2V](https://console.runpod.io/deploy?template=9i0lkwau54&ref=se4tkc5o) | Guide a reference subject with a driving video |

## Start here

1. [Deploy the WAN 2.2 T2V template](https://console.runpod.io/deploy?template=qvozvvb1xd&ref=se4tkc5o).
2. Select a supported NVIDIA GPU and sufficient Pod RAM.
3. Use a persistent volume with space for models, inputs and outputs.
4. Set `PASSWORD` and any required download tokens.
5. Avoid Pods without a region; they can be unstable.
6. Deploy and follow the container logs.
7. Wait for `Provisioning done, ready to create AI content` before opening ComfyUI.
8. Load a supplied T2V workflow and run a small first test.

## Included workflows and components

- WAN 2.2 A14B high- and low-noise FP16 models.
- Full-precision UMT5 text encoder and WAN VAE.
- LightX2V Distill and Lightning 4-step LoRAs.
- Native ComfyUI and WanVideoWrapper workflows.
- MoE scheduler and Triple KSampler workflows.
- 4× image upscaler.
- CUDA 12.8 with compiled attention and GPU acceleration.
- ComfyUI, Code Server, LoRA Manager and SSH.
- Persistent `/workspace` storage.

## Tested hardware

| Use | GPU | VRAM | Pod RAM | Tested output |
|---|---|---:|---:|---|
| Recommended native | L40S / RTX 6000 Ada | 45 GB | 90 GB | 1024×768, 122 frames |
| Recommended wrapper | L40S / RTX 6000 Ada | 45 GB | 50 GB | 1024×768, 122 frames |
| Limited wrapper with offload | A40 / RTX 6000 | 45 GB | 45 GB | 1024×768, 81 frames |

Actual limits depend on resolution, frame count and offloading. The template reserves **105 GB volume** and **15 GB container disk**.

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
- [I2V + SVI](https://console.runpod.io/deploy?template=moem21s8xb&ref=se4tkc5o) · [Animate](https://console.runpod.io/deploy?template=tp7gj0khyo&ref=se4tkc5o) · [SCAIL-2](https://console.runpod.io/deploy?template=9i0lkwau54&ref=se4tkc5o)
