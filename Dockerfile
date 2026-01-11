# syntax=docker/dockerfile:1.7
# run-comfyui-wan2
FROM ls250824/comfyui-runtime:07012026

# Set Working Directory
WORKDIR /ComfyUI

# Copy ComfyUI configurations
COPY --chmod=644 configuration/comfy.settings.json user/default/comfy.settings.json

# Copy ComfyUI ini settings
COPY --chmod=644 configuration/config.ini user/__manager/config.ini

# Adding requirements internal comfyui-manager
RUN --mount=type=cache,target=/root/.cache/pip \
    python -m pip install --no-cache-dir --root-user-action ignore -c /constraints.txt \
    matrix-nio \
    -r manager_requirements.txt

# Clone
WORKDIR /ComfyUI/custom_nodes

RUN --mount=type=cache,target=/root/.cache/git \
    git clone --depth=1 --filter=blob:none https://github.com/rgthree/rgthree-comfy.git && \
    git clone --depth=1 --filter=blob:none https://github.com/liusida/ComfyUI-Login.git && \
    git clone --depth=1 --filter=blob:none https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git && \
	git clone --depth=1 --filter=blob:none https://github.com/1038lab/ComfyUI-JoyCaption.git && \
    git clone --depth=1 --filter=blob:none https://github.com/kijai/ComfyUI-KJNodes.git && \
    git clone --depth=1 --filter=blob:none https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git && \
	git clone --depth=1 --filter=blob:none https://github.com/kijai/ComfyUI-WanVideoWrapper.git && \
	git clone --depth=1 --filter=blob:none https://github.com/ShmuelRonen/ComfyUI-VideoUpscale_WithModel && \
	git clone --depth=1 --filter=blob:none https://github.com/ClownsharkBatwing/RES4LYF.git && \
	git clone --depth=1 --filter=blob:none https://github.com/BlenderNeko/ComfyUI_Noise.git && \
	git clone --depth=1 --filter=blob:none https://github.com/evanspearman/ComfyMath.git && \
	git clone --depth=1 --filter=blob:none https://github.com/city96/ComfyUI-GGUF.git && \
	git clone --depth=1 --filter=blob:none https://github.com/stduhpf/ComfyUI-WanMoeKSampler.git && \
    git clone --depth=1 --filter=blob:none https://github.com/Azornes/Comfyui-Resolution-Master.git && \
	git clone --depth=1 --filter=blob:none https://github.com/ssitu/ComfyUI_UltimateSDUpscale --recursive && \
	git clone --depth=1 --filter=blob:none https://github.com/WASasquatch/was_affine.git && \
    git clone --depth=1 --filter=blob:none https://github.com/VraethrDalkr/ComfyUI-TripleKSampler.git && \
	git clone --depth=1 --filter=blob:none https://github.com/kijai/ComfyUI-segment-anything-2.git && \
    git clone --depth=1 --filter=blob:none https://github.com/1038lab/ComfyUI-RMBG.git && \
	git clone --depth=1 --filter=blob:none https://github.com/Fannovel16/comfyui_controlnet_aux.git && \
	git clone --depth=1 --filter=blob:none https://github.com/liusida/ComfyUI-AutoCropFaces.git && \
	git clone --depth=1 --filter=blob:none https://github.com/DecartAI/Lucy-Edit-ComfyUI.git && \
	git clone --depth=1 --filter=blob:none https://github.com/GizmoR13/PG-Nodes.git && \
	git clone --depth=1 --filter=blob:none https://github.com/vrgamegirl19/comfyui-vrgamedevgirl.git && \
	git clone --depth=1 --filter=blob:none https://github.com/BigStationW/ComfyUi-Scale-Image-to-Total-Pixels-Advanced && \
	git clone --depth=1 --filter=blob:none https://github.com/x3bits/ComfyUI-Power-Flow.git && \
	git clone --depth=1 --filter=blob:none https://github.com/9nate-drake/Comfyui-SecNodes.git && \
	git clone --depth=1 --filter=blob:none https://github.com/jalberty2018/IAMCCS-nodes.git && \
	git clone --depth=1 --filter=blob:none https://github.com/cmeka/ComfyUI-WanMoEScheduler.git && \
	git clone --depth=1 --filter=blob:none https://github.com/wallen0322/ComfyUI-WanAnimate-Enhancer.git  && \
	git clone --depth=1 --filter=blob:none https://github.com/wallen0322/ComfyUI-Wan22FMLF.git && \
	git clone --depth=1 --filter=blob:none https://github.com/princepainter/ComfyUI-PainterI2V.git && \
	git clone --depth=1 --filter=blob:none https://github.com/princepainter/ComfyUI-PainterLongVideo.git && \
	git clone --depth=1 --filter=blob:none https://github.com/princepainter/ComfyUI-PainterI2VforKJ.git && \
	git clone --depth=1 --filter=blob:none https://github.com/princepainter/Comfyui-PainterSampler.git && \
	git clone --depth=1 --filter=blob:none https://github.com/princepainter/Comfyui-PainterFLF2V.git && \
	git clone --depth=1 --filter=blob:none https://github.com/PozzettiAndrea/ComfyUI-SAM3.git && \
	git clone --depth=1 --filter=blob:none https://github.com/princepainter/Comfyui-PainterVRAM.git && \
	git clone --depth=1 --filter=blob:none https://github.com/geroldmeisinger/ComfyUI-outputlists-combiner.git && \
	git clone --depth=1 --filter=blob:none https://github.com/lrzjason/Comfyui-LatentUtils.git && \
	git clone --depth=1 --filter=blob:none https://github.com/kijai/ComfyUI-SCAIL-Pose.git && \
	git clone --depth=1 --filter=blob:none https://github.com/kijai/ComfyUI-WanAnimatePreprocess.git && \
    git clone --depth=1 --filter=blob:none https://github.com/shootthesound/comfyUI-LongLook.git && \
	git clone --depth=1 --filter=blob:none https://github.com/princepainter/ComfyUI-PainterI2Vadvanced.git && \
	git clone --depth=1 --filter=blob:none https://github.com/SeanScripts/ComfyUI-Unload-Model.git && \
	git clone --depth=1 --filter=blob:none https://github.com/Windecay/ComfyUI_Dynamic-RAMCache.git

# Outputlists-combiner working version
# RUN cd ComfyUI-outputlists-combiner && git fetch --unshallow && git checkout be17d247db29d555df4bc1c776b2b9289f7f42ba

# triton-windows error
# RUN cd ComfyUI-RMBG && git fetch --unshallow && git checkout 9ecda2e689d72298b4dca39403a85d13e53ea659

# Rewrite any top-level CPU ORT refs to GPU ORT
RUN set -eux; \
  for f in \
    ComfyUI-RMBG/requirements.txt; do \
      [ -f "$f" ] || continue; \
      sed -i -E 's/^( *| *)(onnxruntime)([<>=].*)?(\s*)$/\1onnxruntime-gpu==1.22.*\4/i' "$f"; \
    done

# VideoWrapper working with TripleKSampler -> e2333d0f04e7292e07d504cb824256f1ca8e63e4 (04dec25)

# IAMCSS V1 used for animate workflow.
# RUN cd IAMCCS-nodes && git checkout 8722d908cdc042baa74bd46549ec32876e234411

# Install Dependencies for Cloned Repositories
WORKDIR /ComfyUI/custom_nodes

RUN --mount=type=cache,target=/root/.cache/pip \
  python -m pip install --no-cache-dir --root-user-action ignore -c /constraints.txt \
    diffusers psutil \
    -r ComfyUI-Login/requirements.txt \
    -r ComfyUI-VideoHelperSuite/requirements.txt \
    -r ComfyUI-KJNodes/requirements.txt \
    -r comfyui-vrgamedevgirl/requirements.txt \
    -r ComfyUI-WanVideoWrapper/requirements.txt \
    -r RES4LYF/requirements.txt \
    -r ComfyUI-GGUF/requirements.txt \
    -r ComfyUI-RMBG/requirements.txt \
    -r Lucy-Edit-ComfyUI/requirements.txt \
    -r comfyui_controlnet_aux/requirements.txt \
	-r Comfyui-SecNodes/requirements.txt \
	-r ComfyUI-JoyCaption/requirements.txt \
	-r ComfyUI-JoyCaption/requirements_gguf.txt \
	-r ComfyUI-outputlists-combiner/requirements.txt \
	-r ComfyUI-SCAIL-Pose/requirements.txt \
	-r ComfyUI-WanAnimatePreprocess/requirements.txt

# Activate SAM3
WORKDIR /ComfyUI/custom_nodes/ComfyUI-SAM3
RUN python install.py

# Own custom_nodes (local)
WORKDIR /ComfyUI/custom_nodes
COPY --chmod=755 nodes/ ComfyUI-JANodes

# Set Working Directory
WORKDIR /

# Clone documentation repo into /comfyui-docs
RUN --mount=type=cache,target=/root/.cache/git \
    git clone --depth=1 --filter=blob:none https://github.com/jalberty2018/comfyui-docs.git /comfyui-docs

# Copy docs *inside* the image
RUN mkdir -p /docs && \
    cp /comfyui-docs/ComfyUI_WAN_configuration.md /docs/ComfyUI_WAN_configuration.md && \
    cp /comfyui-docs/ComfyUI_WAN_custom_nodes.md /docs/ComfyUI_WAN_custom_nodes.md && \
    cp /comfyui-docs/ComfyUI_WAN_hardware.md /docs/ComfyUI_WAN_hardware.md && \
    cp /comfyui-docs/ComfyUI_WAN_image_setup.md /docs/ComfyUI_WAN_image_setup.md && \
    cp /comfyui-docs/ComfyUI_WAN_resources.md /docs/ComfyUI_WAN_resources.md

# Copy Scripts and documentation
COPY --chmod=755 start.sh onworkspace/comfyui-on-workspace.sh onworkspace/files-on-workspace.sh onworkspace/test-on-workspace.sh onworkspace/docs-on-workspace.sh / 
COPY --chmod=664 documentation/README.md /README.md
COPY --chmod=644 onworkspace/batch.txt /batch.txt
COPY --chmod=644 test/ /test
COPY --chmod=644 docs/ /docs

# Cleanup
RUN rm -rf /comfyui-docs

# Set Workspace
WORKDIR /workspace

# Expose Necessary Ports
EXPOSE 8188 9000

# Labels
LABEL org.opencontainers.image.title="ComfyUI 0.8.0b for WAN 2.x inference" \
      org.opencontainers.image.description="ComfyUI + internal manager + flash-attn + sageattention + onnxruntime-gpu + torch_generic_nms + code-server + civitai downloader + huggingface_hub + custom_nodes" \
      org.opencontainers.image.source="https://hub.docker.com/r/ls250824/run-comfyui-wan2" \
      org.opencontainers.image.licenses="MIT"

# Test
RUN python -c "import torch, torchvision, torchaudio, triton, importlib, importlib.util as iu; \
print(f'Torch: {torch.__version__}'); \
print(f'Torchvision: {torchvision.__version__}'); \
print(f'Torchaudio: {torchaudio.__version__}'); \
print(f'Triton: {triton.__version__}'); \
name = 'onnxruntime_gpu' if iu.find_spec('onnxruntime_gpu') else ('onnxruntime' if iu.find_spec('onnxruntime') else None); \
ver = (importlib.import_module(name).__version__ if name else 'not installed'); \
label = 'ONNXRuntime-GPU' if name=='onnxruntime_gpu' else 'ONNXRuntime'; \
print(f'{label}: {ver}'); \
print('CUDA available:', torch.cuda.is_available()); \
print('CUDA version:', torch.version.cuda); \
print('Device:', torch.cuda.get_device_name(0) if torch.cuda.is_available() else 'CPU')"

# Start Server
CMD [ "/start.sh" ]
