FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-runtime

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl unzip vim wget gnupg git && \
    apt-get install -y libglu1-mesa libglib2.0-0 gcc g++ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install ComfyUI
RUN cd /root \
    && git clone https://github.com/comfyanonymous/ComfyUI.git \
    && cd ComfyUI && pip install -r requirements.txt

RUN cd /root/ComfyUI/custom_nodes \
    && git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git \
    && git clone https://github.com/WASasquatch/was-node-suite-comfyui.git \
    && git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git \
    && git clone https://github.com/Off-Live/ComfyUI-off-suite.git \
    && git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git \
    && git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git \
    && git clone https://github.com/mav-rik/facerestore_cf.git \
    && git clone https://github.com/biegert/ComfyUI-CLIPSeg \
    && cp ./ComfyUI-CLIPSeg/custom_nodes/clipseg.py . \
    && rm -rf ./ComfyUI-CLIPSeg \
    && git clone https://github.com/Gourieff/comfyui-reactor-node.git \
    && git clone https://github.com/sipherxyz/comfyui-art-venture.git \
    && git clone https://github.com/BadCafeCode/masquerade-nodes-comfyui.git \
    && git clone https://github.com/cubiq/ComfyUI_essentials.git \
    && git clone https://github.com/ltdrdata/ComfyUI-Manager \
    && git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack \
    && git clone https://github.com/cubiq/ComfyUI_InstantID 
    

# update custom nodes
RUN cd /root/ComfyUI/custom_nodes/ComfyUI-Impact-Pack && git submodule update --init --recursive && python install.py
RUN cd /root/ComfyUI/custom_nodes/was-node-suite-comfyui && pip install -r requirements.txt
RUN cd /root/ComfyUI/custom_nodes/comfyui_controlnet_aux && echo "\nonnxruntime-gpu" >> requirements.txt && pip install -r requirements.txt
RUN cd /root/ComfyUI/custom_nodes/facerestore_cf && pip install -r requirements.txt
RUN cd /root/ComfyUI/custom_nodes/comfyui-art-venture && pip install -r requirements.txt
RUN pip install insightface

RUN cd /root/ComfyUI && python main.py --quick-test-for-ci --cpu

CMD [ "python", "/root/ComfyUI/main.py", "--listen", "--gpu-only" ]
