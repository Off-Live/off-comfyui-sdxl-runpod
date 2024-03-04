### OFF-COMFYUI-SDXL-RUNPOD-DOCKER

#### Prerequisite:
- Docker
- Models for Comfy (download and put them inside models folder)
```
aws s3 sync s3://comfy-sdxl-models/ ./models
```

#### How to build
```shell
docker compose build --no-cache
```

#### How to use in local environment
- If you want to run this on windows, please read https://docs.nvidia.com/cuda/wsl-user-guide/index.html and https://docs.nvidia.com/ai-enterprise/deployment-guide-vmware/0.1.0/docker.html

- Update the models folder path in *compose.yaml* file to map to your local drive before run the command

```bash
docker compose up
```

#### How to use in runpod
- Prepare network storage on runpod, and run a new GPU pod.
- At the first time, the symbolic link will not work because the s3 files are not synced yet. So, run the sync command on `Prerequisite` and link manually. You have to sync the s3 files to `/workspace/models`. Otherwise, the automatic setup of simlink will not work. 
- From next time, just use the network storage and this container when you make a new gpu pod. That's all.
