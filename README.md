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

#### How to use
- If you want to run this on windows, please read https://docs.nvidia.com/cuda/wsl-user-guide/index.html and https://docs.nvidia.com/ai-enterprise/deployment-guide-vmware/0.1.0/docker.html

- Update the models folder path in *compose.yaml* file to map to your local drive before run the command

```bash
docker compose up
```
