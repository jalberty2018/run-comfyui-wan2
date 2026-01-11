import os
import folder_paths
import comfy.utils


class StringLoraLoader:
    """
    Load LoRA maar met lora_name als STRING input.
    - lora_name: bv "my_lora.safetensors" of "subfolder/my_lora.safetensors"
    - als lora_name leeg is of 'none' => model/clip ongewijzigd terug.
    """

    @classmethod
    def INPUT_TYPES(cls):
        return {
            "required": {
                "model": ("MODEL",),
                "clip": ("CLIP",),
                "lora_name": ("STRING", {
                    "default": "none",
                    "multiline": False
                }),
                "strength_model": ("FLOAT", {
                    "default": 1.0,
                    "min": -20.0,
                    "max": 20.0,
                    "step": 0.05
                }),
                "strength_clip": ("FLOAT", {
                    "default": 1.0,
                    "min": -20.0,
                    "max": 20.0,
                    "step": 0.05
                }),
            }
        }

    RETURN_TYPES = ("MODEL", "CLIP")
    FUNCTION = "load_lora"
    CATEGORY = "loaders"

    def _resolve_lora_name(self, lora_name: str):
        """
        Probeert een geldige LoRA filename te vinden op basis van:
        - exacte match
        - match zonder extensie
        - match met .safetensors/.pt/.ckpt
        - match op basename (als je enkel "mylora" opgeeft)
        """
        if not lora_name:
            return None

        name = lora_name.strip().strip('"').strip("'")
        if name.lower() in ("none", "null", "undefined"):
            return None

        # ComfyUI bekende LoRA files (inclusief subfolders)
        available = folder_paths.get_filename_list("loras")
        if not available:
            return None

        # 1) exact (case-sensitive)
        if name in available:
            return name

        # 2) exact, maar normaliseer slashes
        norm = name.replace("\\", "/")
        if norm in available:
            return norm

        # 3) probeer met extensies
        root, ext = os.path.splitext(norm)
        if ext == "":
            for e in (".safetensors", ".pt", ".ckpt"):
                cand = root + e
                if cand in available:
                    return cand

        # 4) basename match (laatste redmiddel)
        base = os.path.basename(root if ext else norm)
        for f in available:
            f_base = os.path.splitext(os.path.basename(f))[0]
            if f_base == base:
                return f

        return None

    def load_lora(self, model, clip, lora_name, strength_model, strength_clip):
        resolved = self._resolve_lora_name(lora_name)

        # als none/ongeldig => return unchanged
        if resolved is None:
            return (model, clip)

        lora_path = folder_paths.get_full_path("loras", resolved)
        if lora_path is None:
            # fail-safe: unchanged
            return (model, clip)

        lora = comfy.utils.load_torch_file(lora_path, safe_load=True)
        model_lora, clip_lora = comfy.sd.load_lora_for_models(
            model, clip, lora, strength_model, strength_clip
        )
        return (model_lora, clip_lora)


NODE_CLASS_MAPPINGS = {
    "StringLoraLoader": StringLoraLoader,
}

NODE_DISPLAY_NAME_MAPPINGS = {
    "StringLoraLoader": "Load LoRA (Text)",
}