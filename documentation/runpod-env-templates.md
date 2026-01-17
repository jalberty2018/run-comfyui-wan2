# Environment variables for templates

## WAN 2.2

### t2v

#### Public

```bash
HF_MODEL_DIFFUSION_MODELS1=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_DIFFUSION_MODELS_FILENAME1=split_files/diffusion_models/wan2.2_t2v_low_noise_14B_fp16.safetensors
HF_MODEL_DIFFUSION_MODELS2=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_DIFFUSION_MODELS_FILENAME2=split_files/diffusion_models/wan2.2_t2v_high_noise_14B_fp16.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_UPSCALER2=LS110824/upscale
HF_MODEL_UPSCALER_PTH2=4x_foolhardy_Remacri.pth
HF_MODEL_LORA1=LS110824/Wan21_lora
HF_MODEL_LORA_FILENAME1=DetailEnhancerV1.safetensors
HF_MODEL_LORA2=LS110824/Wan21_lora
HF_MODEL_LORA_FILENAME2=HighSpeedDynamics.safetensors
HF_MODEL_LORA3=vrgamedevgirl84/Wan14BT2VFusioniX
HF_MODEL_LORA_FILENAME3=FusionX_LoRa/Wan2.1_T2V_14B_FusionX_LoRA.safetensors
HF_MODEL_LORA4=lightx2v/Wan2.2-Lightning
HF_MODEL_LORA_FILENAME4=Wan2.2-T2V-A14B-4steps-lora-rank64-Seko-V2.0/high_noise_model.safetensors
HF_MODEL_LORA5=lightx2v/Wan2.2-Lightning
HF_MODEL_LORA_FILENAME5=Wan2.2-T2V-A14B-4steps-lora-rank64-Seko-V2.0/low_noise_model.safetensors
HF_MODEL_LORA6=lightx2v/Wan2.2-Distill-Loras
HF_MODEL_LORA_FILENAME6=wan2.2_t2v_A14b_high_noise_lora_rank64_lightx2v_4step_1217.safetensors
HF_MODEL_LORA7=lightx2v/Wan2.2-Distill-Loras
HF_MODEL_LORA_FILENAME7=wan2.2_t2v_A14b_low_noise_lora_rank64_lightx2v_4step_1217.safetensors
HF_MODEL_LORA8=LS110824/Wan21_lora 
HF_MODEL_LORA_FILENAME8=Wan14B_RealismBoost_T2V.safetensors
HF_MODEL_LORA9=lightx2v/Wan2.2-Lightning
HF_MODEL_LORA_FILENAME9=Wan2.2-T2V-A14B-4steps-lora-250928/high_noise_model.safetensors
HF_MODEL_LORA10=lightx2v/Wan2.2-Lightning
HF_MODEL_LORA_FILENAME10=Wan2.2-T2V-A14B-4steps-lora-250928/low_noise_model.safetensors
WORKFLOW1=https://provisioning.rozenlaan.site/wan/WAN22-t2v-MoeKSampler-pod.json
WORKFLOW2=https://provisioning.rozenlaan.site/wan/WAN22-t2v-MoeSamplerAdv-pod.json
WORKFLOW3=https://provisioning.rozenlaan.site/wan/WAN22-t2v-TripleKSampler-pod.json
WORKFLOW4=https://provisioning.rozenlaan.site/wan/WAN22-wrapper-t2v-TripleKSampler-pod.json
WORKFLOW5=https://provisioning.rozenlaan.site/wan/WAN22-wrapper-t2v-MoESheduler-pod.json
```

#### Private with lighning

```bash
CIVITAI_TOKEN="{{ RUNPOD_SECRET_CivitAI_API_KEY }}"
HF_TOKEN="{{ RUNPOD_SECRET_HF_TOKEN_WRITE }}"
PASSWORD="{{ RUNPOD_SECRET_CODE-SERVER-NEW }}"
HF_MODEL_DIFFUSION_MODELS1=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_DIFFUSION_MODELS_FILENAME1=split_files/diffusion_models/wan2.2_t2v_low_noise_14B_fp16.safetensors
HF_MODEL_DIFFUSION_MODELS2=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_DIFFUSION_MODELS_FILENAME2=split_files/diffusion_models/wan2.2_t2v_high_noise_14B_fp16.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_UPSCALER1=LS110824/upscale
HF_MODEL_UPSCALER_PTH1=4x_foolhardy_Remacri.pth
HF_MODEL_LORA1=lightx2v/Wan2.2-Lightning
HF_MODEL_LORA_FILENAME1=Wan2.2-T2V-A14B-4steps-lora-250928/high_noise_model.safetensors
HF_MODEL_LORA2=lightx2v/Wan2.2-Lightning
HF_MODEL_LORA_FILENAME2=Wan2.2-T2V-A14B-4steps-lora-250928/low_noise_model.safetensors
HF_MODEL_LORA3=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME3=Wan2.2-T2V-AgeSlider-14B_high_noise.safetensors
HF_MODEL_LORA4=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME4=Wan2.2-T2V-AgeSlider-14B_low_noise.safetensors
HF_MODEL_LORA5=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME5=Wan2.2-T2V-BodySizeSliderv2-HIGH14B.safetensors
HF_MODEL_LORA6=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME6=Wan2.2-T2V-BodySizeSliderv2-LOW14B.safetensors
HF_MODEL_LORA7=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME7=Wan2.2-T2V-SameFaceFixv2-HIGH14B.safetensors
HF_MODEL_LORA8=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME8=Wan2.2-T2V-SameFaceFixv2-LOW14B.safetensors
HF_MODEL_LORA9=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME9=wan_2.2_t2v_highnoise_broken_v1.0.safetensors
HF_MODEL_LORA10=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME10=wan_2.2_t2v_lownoise_broken_v1.0.safetensors
HF_MODEL_LORA11=lightx2v/Wan2.2-Distill-Loras
HF_MODEL_LORA_FILENAME11=wan2.2_t2v_A14b_high_noise_lora_rank64_lightx2v_4step_1217.safetensors
HF_MODEL_LORA12=lightx2v/Wan2.2-Distill-Loras
HF_MODEL_LORA_FILENAME12=wan2.2_t2v_A14b_low_noise_lora_rank64_lightx2v_4step_1217.safetensors
WORKFLOW1=https://provisioning.rozenlaan.site/wan/WAN22-t2v-MoeKSampler-pod.json
WORKFLOW2=https://provisioning.rozenlaan.site/wan/WAN22-t2v-MoeSamplerAdv-pod.json
WORKFLOW3=https://provisioning.rozenlaan.site/wan/WAN22-t2v-TripleKSampler-pod.json
WORKFLOW4=https://provisioning.rozenlaan.site/wan/WAN22-wrapper-t2v-TripleKSampler-pod.json
WORKFLOW5=https://provisioning.rozenlaan.site/wan/WAN22-wrapper-t2v-MoESheduler-pod.json
```

### Dyno

```bash
CIVITAI_TOKEN="{{ RUNPOD_SECRET_CivitAI_API_KEY }}"
HF_TOKEN="{{ RUNPOD_SECRET_HF_TOKEN_WRITE }}"
PASSWORD="{{ RUNPOD_SECRET_CODE-SERVER-NEW }}"
HF_MODEL_DIFFUSION_MODELS1=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_DIFFUSION_MODELS_FILENAME1=split_files/diffusion_models/wan2.2_t2v_low_noise_14B_fp16.safetensors
HF_MODEL_DIFFUSION_MODELS2=lightx2v/Wan2.2-Lightning
HF_MODEL_DIFFUSION_MODELS_FILENAME2=Wan2.2-T2V-A14B-4steps-250928-dyno/Wan2.2-T2V-A14B-4steps-250928-dyno-high-lightx2v.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_LORA1=lightx2v/Wan2.2-Lightning
HF_MODEL_LORA_FILENAME1=Wan2.2-T2V-A14B-4steps-lora-250928/low_noise_model.safetensors
HF_MODEL_LORA2=LS110824/Wan21_lora 
HF_MODEL_LORA_FILENAME2=Wan14B_RealismBoost_T2V.safetensors
HF_MODEL_LORA3=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME3=Wan2.2-T2V-AgeSlider-14B_high_noise.safetensors
HF_MODEL_LORA4=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME4=Wan2.2-T2V-AgeSlider-14B_low_noise.safetensors
HF_MODEL_LORA5=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME5=Wan2.2-T2V-BodySizeSliderv2-HIGH14B.safetensors
HF_MODEL_LORA6=LS110824/Wan22_lora
HF_MODEL_LORA_FILENAME6=Wan2.2-T2V-BodySizeSliderv2-LOW14B.safetensors
WORKFLOW1=https://provisioning.rozenlaan.site/wan/WAN22-t2v-MoeSamplerAdv-Dyno-pod.json
```

### i2v + SVI Pro (lighning,longvideo)

#### Public

```bash
HF_MODEL_DIFFUSION_MODELS1=lightx2v/Wan2.2-Official-Models
HF_MODEL_DIFFUSION_MODELS_FILENAME1=wan2.2_i2v_A14b_high_noise_lightx2v.safetensors
HF_MODEL_DIFFUSION_MODELS2=lightx2v/Wan2.2-Official-Models
HF_MODEL_DIFFUSION_MODELS_FILENAME2=wan2.2_i2v_A14b_low_noise_lightx2v.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_CLIP_VISION1=ricecake/wan21NSFWClipVisionH_v10
HF_MODEL_CLIP_VISION_FILENAME1=wan21NSFWClipVisionH_v10.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_UPSCALER1=LS110824/upscale
HF_MODEL_UPSCALER_PTH1=4x_foolhardy_Remacri.pth
HF_MODEL_LORA1=lightx2v/Wan2.2-Distill-Loras
HF_MODEL_LORA_FILENAME1=wan2.2_i2v_A14b_high_noise_lora_rank64_lightx2v_4step_1022.safetensors
HF_MODEL_LORA2=lightx2v/Wan2.2-Distill-Loras
HF_MODEL_LORA_FILENAME2=wan2.2_i2v_A14b_low_noise_lora_rank64_lightx2v_4step_1022.safetensors
HF_MODEL_LORA3=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME3=LoRAs/Stable-Video-Infinity/v2.0/SVI_v2_PRO_Wan2.2-I2V-A14B_HIGH_lora_rank_128_fp16.safetensors
HF_MODEL_LORA4=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME4=LoRAs/Stable-Video-Infinity/v2.0/SVI_v2_PRO_Wan2.2-I2V-A14B_LOW_lora_rank_128_fp16.safetensors
HF_MODEL_LORA5=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME5=LoRAs/Wan22_Lightx2v/Wan_2_2_I2V_A14B_HIGH_lightx2v_4step_lora_v1030_rank_64_bf16.safetensors
HF_MODEL1=VeryAladeen/Sec-4B
HF_MODEL_FILENAME1=SeC-4B-fp16.safetensors
HF_MODEL_DIR1=models/sams
WORKFLOW1=https://provisioning.rozenlaan.site/wan/WAN22-i2v-TripleKSampler-pod.json
WORKFLOW2=https://provisioning.rozenlaan.site/wan/WAN22-i2v-PainterAdvanced-pod.json
WORKFLOW3=https://provisioning.rozenlaan.site/wan/WAN22-wrapper-i2v-TripleKSampler-pod.json
WORKFLOW4=https://provisioning.rozenlaan.site/wan/WAN22-wrapper-i2v-MoESheduler-pod.json
WORKFLOW5=https://provisioning.rozenlaan.site/wan/WAN22-wrapper-i2v-SVI-20-pro-pod.json
WORKFLOW6=https://provisioning.rozenlaan.site/wan/WAN22-i2v-SVI-20-pro-pod.json
```
#### Private

```bash
CIVITAI_TOKEN="{{ RUNPOD_SECRET_CivitAI_API_KEY }}"
HF_TOKEN="{{ RUNPOD_SECRET_HF_TOKEN_WRITE }}"
PASSWORD="{{ RUNPOD_SECRET_CODE-SERVER-NEW }}"
HF_MODEL_DIFFUSION_MODELS1=lightx2v/Wan2.2-Official-Models
HF_MODEL_DIFFUSION_MODELS_FILENAME1=wan2.2_i2v_A14b_high_noise_lightx2v.safetensors
HF_MODEL_DIFFUSION_MODELS2=lightx2v/Wan2.2-Official-Models
HF_MODEL_DIFFUSION_MODELS_FILENAME2=wan2.2_i2v_A14b_low_noise_lightx2v.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_CLIP_VISION1=ricecake/wan21NSFWClipVisionH_v10
HF_MODEL_CLIP_VISION_FILENAME1=wan21NSFWClipVisionH_v10.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_UPSCALER1=LS110824/upscale
HF_MODEL_UPSCALER_PTH1=4x_foolhardy_Remacri.pth
HF_MODEL_LORA1=lightx2v/Wan2.2-Distill-Loras
HF_MODEL_LORA_FILENAME1=wan2.2_i2v_A14b_high_noise_lora_rank64_lightx2v_4step_1022.safetensors
HF_MODEL_LORA2=lightx2v/Wan2.2-Distill-Loras
HF_MODEL_LORA_FILENAME2=wan2.2_i2v_A14b_low_noise_lora_rank64_lightx2v_4step_1022.safetensors
HF_MODEL_LORA3=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME3=LoRAs/Stable-Video-Infinity/v2.0/SVI_v2_PRO_Wan2.2-I2V-A14B_HIGH_lora_rank_128_fp16.safetensors
HF_MODEL_LORA4=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME4=LoRAs/Stable-Video-Infinity/v2.0/SVI_v2_PRO_Wan2.2-I2V-A14B_LOW_lora_rank_128_fp16.safetensors
HF_MODEL_LORA5=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME5=LoRAs/Wan22_Lightx2v/Wan_2_2_I2V_A14B_HIGH_lightx2v_4step_lora_v1030_rank_64_bf16.safetensors
WORKFLOW1=https://provisioning.rozenlaan.site/wan/WAN22-i2v-TripleKSampler-pod.json
WORKFLOW2=https://provisioning.rozenlaan.site/wan/WAN22-i2v-PainterAdvanced-pod.json
WORKFLOW3=https://provisioning.rozenlaan.site/wan/WAN22-wrapper-i2v-TripleKSampler-pod.json
WORKFLOW4=https://provisioning.rozenlaan.site/wan/WAN22-wrapper-i2v-MoESheduler-pod.json
WORKFLOW5=https://provisioning.rozenlaan.site/wan/WAN22-wrapper-i2v-SVI-20-pro-pod.json
WORKFLOW6=https://provisioning.rozenlaan.site/wan/WAN22-i2v-SVI-20-pro-pod.json
```

### animate (lightning)

#### Public

```bash
HF_MODEL_DIFFUSION_MODELS1=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_DIFFUSION_MODELS_FILENAME1=split_files/diffusion_models/wan2.2_animate_14B_bf16.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_CLIP_VISION1=ricecake/wan21NSFWClipVisionH_v10
HF_MODEL_CLIP_VISION_FILENAME1=wan21NSFWClipVisionH_v10.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_UPSCALER1=LS110824/upscale
HF_MODEL_UPSCALER_PTH1=4x_foolhardy_Remacri.pth
HF_MODEL_LORA1=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME1=Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
HF_MODEL_LORA2=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_LORA_FILENAME2=split_files/loras/wan2.2_animate_14B_relight_lora_bf16.safetensors
HF_MODEL_LORA3=LS110824/Wan21_lora
HF_MODEL_LORA_FILENAME3=Wan14B_RealismBoost_T2V.safetensors
HF_MODEL1=VeryAladeen/Sec-4B
HF_MODEL_FILENAME1=SeC-4B-fp16.safetensors
HF_MODEL_DIR1=models/sams
WORKFLOW1=https://provisioning.rozenlaan.site/wan/WAN22-animate-vi2v-sam2-pod.json
WORKFLOW2=https://provisioning.rozenlaan.site/wan/WAN22-animate-vi2v-sam3-pod.json
WORKFLOW3=https://provisioning.rozenlaan.site/wan/WAN22-animate-vi2v-sam3-point-collector-pod.json
```

#### Private

```bash
CIVITAI_TOKEN="{{ RUNPOD_SECRET_CivitAI_API_KEY }}"
HF_TOKEN="{{ RUNPOD_SECRET_HF_TOKEN_WRITE }}"
PASSWORD="{{ RUNPOD_SECRET_CODE-SERVER-NEW }}"
HF_MODEL_DIFFUSION_MODELS1=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_DIFFUSION_MODELS_FILENAME1=split_files/diffusion_models/wan2.2_animate_14B_bf16.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_CLIP_VISION1=ricecake/wan21NSFWClipVisionH_v10
HF_MODEL_CLIP_VISION_FILENAME1=wan21NSFWClipVisionH_v10.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_LORA1=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME1=Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
HF_MODEL_LORA2=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_LORA_FILENAME2=split_files/loras/wan2.2_animate_14B_relight_lora_bf16.safetensors
HF_MODEL_LORA3=LS110824/Wan21_lora
HF_MODEL_LORA_FILENAME3=Wan14B_RealismBoost_T2V.safetensors
HF_MODEL1=VeryAladeen/Sec-4B
HF_MODEL_FILENAME1=SeC-4B-fp16.safetensors
HF_MODEL_DIR1=models/sams
HF_MODEL2=facebook/sam3
HF_MODEL_FILENAME2=sam3.pt
HF_MODEL_DIR2=models/sam3
WORKFLOW1=https://provisioning.rozenlaan.site/wan/WAN22-animate-vi2v-sam2-pod.json
WORKFLOW2=https://provisioning.rozenlaan.site/wan/WAN22-animate-vi2v-sam3-pod.json
WORKFLOW3=https://provisioning.rozenlaan.site/wan/WAN22-animate-vi2v-sam3-point-collector-pod.json
``` 

### s2v

```bash
CIVITAI_TOKEN="{{ RUNPOD_SECRET_CivitAI_API_KEY }}"
HF_TOKEN="{{ RUNPOD_SECRET_HF_TOKEN_WRITE }}"
PASSWORD="{{ RUNPOD_SECRET_CODE-SERVER-NEW }}"
HF_MODEL_DIFFUSION_MODELS1=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_DIFFUSION_MODELS_FILENAME1=split_files/diffusion_models/wan2.2_s2v_14B_bf16.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_AUDIO_ENCODERS1=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_AUDIO_ENCODERS_FILENAME1=split_files/audio_encoders/wav2vec2_large_english_fp16.safetensors
HF_MODEL_UPSCALER1=LS110824/upscale
HF_MODEL_UPSCALER_PTH1=4x_foolhardy_Remacri.pth
```

### ti2v Longcat (long video generation)

#### private

```bash
CIVITAI_TOKEN="{{ RUNPOD_SECRET_CivitAI_API_KEY }}"
HF_TOKEN="{{ RUNPOD_SECRET_HF_TOKEN_WRITE }}"
PASSWORD="{{ RUNPOD_SECRET_CODE-SERVER-NEW }}"
HF_MODEL_DIFFUSION_MODELS1=Kijai/LongCat-Video_comfy
HF_MODEL_DIFFUSION_MODELS_FILENAME1=LongCat_TI2V_comfy_bf16.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_LORA1=Kijai/LongCat-Video_comfy
HF_MODEL_LORA_FILENAME1=LongCat_distill_lora_alpha64_bf16.safetensors
```

### v2v Lucy Edit 

```bash
CIVITAI_TOKEN="{{ RUNPOD_SECRET_CivitAI_API_KEY }}"
HF_TOKEN="{{ RUNPOD_SECRET_HF_TOKEN_WRITE }}"
PASSWORD="{{ RUNPOD_SECRET_CODE-SERVER-NEW }}"
HF_MODEL_DIFFUSION_MODELS1=decart-ai/Lucy-Edit-Dev-ComfyUI
HF_MODEL_DIFFUSION_MODELS_FILENAME1=lucy-edit-dev-cui-fp16.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_TEXT_ENCODERS1=Comfy-Org/Wan_2.2_ComfyUI_Repackaged
HF_MODEL_TEXT_ENCODERS_FILENAME1=split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors
WORKFLOW1=https://provisioning.rozenlaan.site/wan/Lucy-edit-v2v-dev-pod.json
```

## WAN 2.1

### SCAIL

#### Public

```bash
HF_MODEL_DIFFUSION_MODELS1=Kijai/WanVideo_comfy
HF_MODEL_DIFFUSION_MODELS_FILENAME1=SCAIL/Wan21-14B-SCAIL-preview_comfy_bf16.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_UPSCALER2=LS110824/upscale
HF_MODEL_UPSCALER_PTH2=4x_foolhardy_Remacri.pth
HF_MODEL_LORA1=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME1=Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
HF_MODEL_CLIP_VISION1=ricecake/wan21NSFWClipVisionH_v10
HF_MODEL_CLIP_VISION_FILENAME1=wan21NSFWClipVisionH_v10.safetensors
HF_MODEL1=JunkyByte/easy_ViTPose
HF_MODEL_FILENAME1=onnx/wholebody/vitpose-l-wholebody.onnx
HF_MODEL_DIR1=models/detection
HF_MODEL2=Wan-AI/Wan2.2-Animate-14B
HF_MODEL_FILENAME2=process_checkpoint/det/yolov10m.onnx
HF_MODEL_DIR2=models/detection
WORKFLOW1=https://provisioning.rozenlaan.site/wan/SCAIL-vi2v-wanwrapper-pod.json
```

#### Private

```bash
CIVITAI_TOKEN="{{ RUNPOD_SECRET_CivitAI_API_KEY }}"
HF_TOKEN="{{ RUNPOD_SECRET_HF_TOKEN_WRITE }}"
PASSWORD="{{ RUNPOD_SECRET_CODE-SERVER-NEW }}"
HF_MODEL_DIFFUSION_MODELS1=Kijai/WanVideo_comfy
HF_MODEL_DIFFUSION_MODELS_FILENAME1=SCAIL/Wan21-14B-SCAIL-preview_comfy_bf16.safetensors
HF_MODEL_VAE1=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME1=Wan2_1_VAE_fp32.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_UPSCALER2=LS110824/upscale
HF_MODEL_UPSCALER_PTH2=4x_foolhardy_Remacri.pth
HF_MODEL_LORA1=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME1=Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
HF_MODEL_CLIP_VISION1=ricecake/wan21NSFWClipVisionH_v10
HF_MODEL_CLIP_VISION_FILENAME1=wan21NSFWClipVisionH_v10.safetensors
HF_MODEL1=JunkyByte/easy_ViTPose
HF_MODEL_FILENAME1=onnx/wholebody/vitpose-l-wholebody.onnx
HF_MODEL_DIR1=models/detection
HF_MODEL2=Wan-AI/Wan2.2-Animate-14B
HF_MODEL_FILENAME2=process_checkpoint/det/yolov10m.onnx
HF_MODEL_DIR2=models/detection
WORKFLOW1=https://provisioning.rozenlaan.site/wan/SCAIL-vi2v-wanwrapper-pod.json
```

### Phantom

```bash
CIVITAI_TOKEN="{{ RUNPOD_SECRET_CivitAI_API_KEY }}"
HF_TOKEN="{{ RUNPOD_SECRET_HF_TOKEN_WRITE }}"
PASSWORD="{{ RUNPOD_SECRET_CODE-SERVER-NEW }}"
HF_MODEL_DIFFUSION_MODELS1=Kijai/WanVideo_comfy
HF_MODEL_DIFFUSION_MODELS_FILENAME1=Phantom-Wan-14B_fp16.safetensors
HF_MODEL_VAE=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME=Wan2_1_VAE_fp32.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_UPSCALER1=LS110824/upscale
HF_MODEL_UPSCALER_PTH1=4x_foolhardy_Remacri.pth
HF_MODEL_LORA1=vrgamedevgirl84/Wan14BT2VFusioniX
HF_MODEL_LORA_FILENAME1=FusionX_LoRa/Phantom_Wan_14B_FusionX_LoRA.safetensors
HF_MODEL_LORA2=Kijai/WanVideo_comfy
HF_MODEL_LORA_FILENAME2=Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank32.safetensors
HF_MODEL_LORA3=LS110824/Wan21_lora
HF_MODEL_LORA_FILENAME3=FusionX_FaceNaturalizer.safetensors
HF_MODEL_LORA4=LS110824/Wan21_lora
HF_MODEL_LORA_FILENAME4=HighSpeedDynamics.safetensors
```

### SkyReels

```bash
CIVITAI_TOKEN="{{ RUNPOD_SECRET_CivitAI_API_KEY }}"
HF_TOKEN="{{ RUNPOD_SECRET_HF_TOKEN_WRITE }}"
PASSWORD="{{ RUNPOD_SECRET_CODE-SERVER-NEW }}"
HF_MODEL_DIFFUSION_MODELS1=Kijai/WanVideo_comfy
HF_MODEL_DIFFUSION_MODELS_FILENAME1=Skyreels/Wan2_1-SkyReels-V2-DF-14B-720P_fp16.safetensors
HF_MODEL_VAE=Kijai/WanVideo_comfy
HF_MODEL_VAE_FILENAME=Wan2_1_VAE_fp32.safetensors
HF_MODEL_TEXT_ENCODERS1=LS110824/text_encoders
HF_MODEL_TEXT_ENCODERS_FILENAME1=wan21UMT5XxlFP32_fp32.safetensors
HF_MODEL_UPSCALER2=LS110824/upscale
HF_MODEL_UPSCALER_PTH2=4x_foolhardy_Remacri.pth
HF_MODEL_LORA1=LS110824/Wan21_lora
HF_MODEL_LORA_FILENAME1=DetailEnhancerV1.safetensors
HF_MODEL_LORA2=LS110824/Wan21_lora
HF_MODEL_LORA_FILENAME2=HighSpeedDynamics.safetensors
HF_MODEL_LORA3=vrgamedevgirl84/Wan14BT2VFusioniX
HF_MODEL_LORA_FILENAME3=FusionX_LoRa/Wan2.1_T2V_14B_FusionX_LoRA.safetensors
HF_MODEL_LORA4=LS110824/Wan21_lora
HF_MODEL_LORA_FILENAME4=HighSpeedDynamics.safetensors
```
