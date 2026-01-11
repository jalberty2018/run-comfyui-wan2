import folder_paths

class Lora2StackToString:
    @classmethod
    def INPUT_TYPES(cls):
        loras = folder_paths.get_filename_list("loras")
        choices = ["none"] + list(loras)

        return {
            "required": {
                "lora_high": (choices,),
                "strength_high": (
                    "FLOAT",
                    {"default": 1.0, "min": -10.0, "max": 10.0, "step": 0.05}
                ),
                "lora_low": (choices,),
                "strength_low": (
                    "FLOAT",
                    {"default": 1.0, "min": -10.0, "max": 10.0, "step": 0.05}
                ),
            }
        }

    RETURN_TYPES = ("STRING",)
    RETURN_NAMES = ("lora_string",)
    FUNCTION = "build"
    CATEGORY = "utils/loras"

    def build(self, lora_high, strength_high, lora_low, strength_low):
        out = f"{lora_high},{strength_high},{lora_low},{strength_low},"
        return (out,)

		
NODE_CLASS_MAPPINGS = {
    "Lora2StackToString": Lora2StackToString,
}

NODE_DISPLAY_NAME_MAPPINGS = {
    "Lora2StackToString": "LoRA high/low → fixed string",
}