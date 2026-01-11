# Detection models

- [Yolov](https://huggingface.co/Wan-AI/Wan2.2-Animate-14B/blob/main/process_checkpoint/det)
- [Wholebody](https://huggingface.co/JunkyByte/easy_ViTPose/tree/main/onnx/wholebody)

## Models

```bash
hf download JunkyByte/easy_ViTPose onnx/wholebody/vitpose-l-wholebody.onnx \ 
--local-dir=/workspace/ComfyUI/models/detection

hf download Wan-AI/Wan2.2-Animate-14B process_checkpoint/det/yolov10m.onnx \
--local-dir=/workspace/ComfyUI/models/detection
```