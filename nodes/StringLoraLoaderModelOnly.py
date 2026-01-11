import os
import folder_paths
import comfy.utils

class StringLoraLoaderModelOnly:
    """
    Loads a LoRA by name (string) from ComfyUI/models/loras and applies it to the MODEL only.
    """

    @classmethod
    def INPUT_TYPES(cls):
        return {
            "required": {
                "model": ("MODEL",),
                "lora_name": ("STRING", {
                    "default": "",
                    "multiline": False,
                    "placeholder": "none"
                }),
                "strength_model": ("FLOAT", {
                    "default": 1.0,
                    "min": -10.0,
                    "max": 10.0,
                    "step": 0.05
                }),
            }
        }

    RETURN_TYPES = ("MODEL",)
    FUNCTION = "apply"
    CATEGORY = "loaders/lora"

    def _resolve_lora_path(self, lora_name: str) -> str:
        if not lora_name or not lora_name.strip():
            raise ValueError("lora_name is empty. Provide a filename in ComfyUI/models/loras/")

        name = lora_name.strip()

        # If user provides absolute path, allow it (optional convenience)
        if os.path.isabs(name):
            if not os.path.isfile(name):
                raise FileNotFoundError(f"LoRA file not found: {name}")
            return name

        # Otherwise resolve relative to ComfyUI loras folder
        loras_dir = folder_paths.get_folder_paths("loras")[0]  # typically .../ComfyUI/models/loras
        candidate = os.path.normpath(os.path.join(loras_dir, name))

        # Safety: keep within loras dir (avoid path traversal)
        loras_dir_norm = os.path.normpath(loras_dir)
        if not candidate.startswith(loras_dir_norm):
            raise ValueError("Invalid lora_name path (must stay inside models/loras).")

        if not os.path.isfile(candidate):
            # Try common extension auto-add if user omitted it
            for ext in (".safetensors", ".pt", ".ckpt"):
                if os.path.isfile(candidate + ext):
                    return candidate + ext
            raise FileNotFoundError(
                f"LoRA file not found: {candidate}\n"
                f"Tip: put it in {loras_dir_norm} (or a subfolder) and use the exact filename."
            )

        return candidate

    def apply(self, model, lora_name: str, strength_model: float):
        if strength_model == 0:
            return (model,)

        lora_path = self._resolve_lora_path(lora_name)

        # Load LoRA weights
        lora = comfy.utils.load_torch_file(lora_path, safe_load=True)

        # Apply to model only (no CLIP)
        model_lora, _clip_unchanged = comfy.sd.load_lora_for_models(
            model, None, lora, strength_model, 0.0
        )

        return (model_lora,)


NODE_CLASS_MAPPINGS = {
    "StringLoraLoaderModelOnly": StringLoraLoaderModelOnly
}

NODE_DISPLAY_NAME_MAPPINGS = {
    "StringLoraLoaderModelOnly": "LoRA Loader (String, Model Only)"
}