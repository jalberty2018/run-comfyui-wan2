# One Click - WAN 2.2 Animate with subject and motion control

Animate, replace or relight a subject using reference video in ComfyUI. WAN Animate 2, VAE, vision/text encoders, acceleration and relighting LoRAs, segmentation models, nodes and workflows are provisioned automatically.

**Uncensored visual conditioning:** this template includes the `wan21NSFWClipVisionH` CLIP Vision model without an additional visual prompt-filtering layer. Users remain responsible for model use and generated content.

## Purpose-built and cost-efficient

This template downloads only WAN Animate components, not the T2V, I2V/SVI or SCAIL-2 models. Separating the workloads avoids unnecessary downloads, storage use and provisioning time.

## Choose a WAN template

| Template | Choose it for |
|---|---|
| **WAN 2.2 Animate — this template** | Subject animation, replacement, relighting and motion transfer |
| [WAN 2.2 T2V](https://console.runpod.io/deploy?template=qvozvvb1xd&ref=se4tkc5o) | Generate video entirely from text |
| [WAN 2.2 I2V + SVI v2 PRO](https://console.runpod.io/deploy?template=moem21s8xb&ref=se4tkc5o) | Animate an image or create longer video |
| [SCAIL-2 VI2V](https://console.runpod.io/deploy?template=9i0lkwau54&ref=se4tkc5o) | Guide a reference subject with a driving video |

## Start here

1. [Deploy the WAN 2.2 Animate template](https://console.runpod.io/deploy?template=tp7gj0khyo&ref=se4tkc5o).
2. Select an L40S or RTX 6000 Ada and sufficient Pod RAM.
3. Use a persistent volume with space for models, source media and output.
4. Set `PASSWORD` and any required download tokens.
5. Avoid Pods without a region; they can be unstable.
6. Deploy and follow the container logs.
7. Wait for `Provisioning done, ready to create AI content` before opening ComfyUI.
8. Load a SAM2 or SAM3 Animate workflow and run a short first test.

## Included workflows and components

- WAN Animate 2 BF16 diffusion model.
- WAN VAE, full-precision UMT5 and uncensored CLIP Vision.
- LightX2V, Animate Relight, RealismBoost, FastWan and Pusa LoRAs.
- Video-to-video subject workflows using SAM2 or SAM3.
- SAM3 point-collector workflow for subject selection.
- 4× image upscaler.
- CUDA 12.8 with compiled attention and GPU acceleration.
- ComfyUI, Code Server, LoRA Manager and SSH.
- Persistent `/workspace` storage.

## Tested hardware

| Recommended GPU | VRAM | Pod RAM | Tested setting |
|---|---:|---:|---|
| L40S / RTX 6000 Ada | 40 GB minimum | 105 GB | 1024×768, 77 chunks per sampler |

Actual requirements depend on source-video length, resolution, masks and offloading. The template reserves **100 GB volume** and **15 GB container disk**.

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
- [T2V](https://console.runpod.io/deploy?template=qvozvvb1xd&ref=se4tkc5o) · [I2V + SVI](https://console.runpod.io/deploy?template=moem21s8xb&ref=se4tkc5o) · [SCAIL-2](https://console.runpod.io/deploy?template=9i0lkwau54&ref=se4tkc5o)
