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

rm -rf /workspace/ComfyUI
rm -rf /root/ComfyUI/models/*
ln -s -f /workspace/models/* /root/ComfyUI/models/
ln -s /root/ComfyUI/ /workspace/ComfyUI

start_jupyter

sleep infinity