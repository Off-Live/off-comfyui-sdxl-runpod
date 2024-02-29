start_jupyter() {
    
        echo "Starting Jupyter Lab..."
        cd / && \
        nohup jupyter lab --allow-root --no-browser --port=8888 --ip=* --FileContentsManager.delete_to_trash=False --ServerApp.terminado_settings='{"shell_command":["/bin/bash"]}' --ServerApp.token=offlive --ServerApp.allow_origin=* --ServerApp.preferred_dir=/workspace &> /jupyter.log &
        echo "Jupyter Lab started"
    
}

echo 'getting aws ready...'
aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID} \
  && aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY} \
  && aws configure set default.region ${AWS_REGION}

mkdir -p /workspace

echo 'models are syncing'

ln -s -f /comfy-models/* /root/ComfyUI/models/


#ln -s -f /workspace/comfy-models/input/* /root/ComfyUI/input/
#ln -s -f /workspace/comfy-models/wildcards/* /root/ComfyUI/custom_nodes/ComfyUI-Impact-Pack/custom_wildcards/
#ln -s -f /workspace/comfy-models/ipadapter/* /root/ComfyUI/custom_nodes/ComfyUI_IPAdapter_plus/models/

ln -s /root/ComfyUI/ /workspace/ComfyUI

start_jupyter



sleep infinity