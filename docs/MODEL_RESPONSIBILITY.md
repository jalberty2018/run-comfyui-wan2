# Model usage and responsibility

This project provides tooling and provisioning for running AI models. This
repository does not contain model weights, and its Dockerfile does not explicitly
bundle them. The runtime can download models automatically according to the
user's deployment settings, or users can download them manually from third-party
repositories. Review template and provisioning settings before starting a pod.

## Model licenses

Every downloaded artifact remains subject to its publisher's license, usage
restrictions and applicable platform policies. The MIT license for this
project's original code does not grant rights to models or their outputs.

Before downloading, running, modifying, redistributing or offering a hosted
service with a model, users are responsible for checking the terms for the
specific model and version, including any territorial, commercial-use,
attribution or redistribution conditions. Check the original publisher's terms
as well as those for any derivative, quantization, LoRA or text encoder.
A successful download is not confirmation that the intended use is permitted.
Calling a model "uncensored" or using it for research does not waive these terms
or applicable laws.

The [model provisioning guides](ComfyUI_WAN_provisioning.md) cover WAN 2.1,
WAN 2.2, Wan Animate, SCAIL, Lucy Edit, LongCat and HuMo, together with
captioning, detection, segmentation, frame-interpolation and upscaling models.
Review each artifact's model card, license file and referenced original publisher
terms separately, including text encoders, VAEs, LoRAs and derivatives.
Different releases within a model family may have different terms; do not assume
that one variant's permissions apply to another. A custom node's software license
does not establish the license of the weights it downloads.

## Responsible use

This project is intended for lawful experimentation, research and creative work.
It is not intended for fraud, deceptive impersonation, harassment, non-consensual
intimate imagery or other unlawful or harmful uses of a person's image or voice.

Users are responsible for obtaining the rights and permissions required for
input images, audio and other material, and for the generation, labeling and
sharing of outputs under applicable laws and model terms. This includes
respecting privacy, consent and intellectual property rights. The project does
not guarantee that a model or its outputs are suitable for a particular use.

These statements explain intended use and user responsibilities; they do not
add restrictions to the MIT license for the project's original code or replace
third-party license terms.
