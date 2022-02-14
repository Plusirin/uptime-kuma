buildx create --use --name uptime-kuma
docker buildx inspect uptime-kuma --bootstrap
docker buildx build -t registry.cn-shanghai.aliyuncs.com/r3-dev/uptime-kuma --platform=linux/arm,linux/arm64,linux/amd64 -f dockerfile-owner . --push
docker buildx build -t ccr.ccs.tencentyun.com/plusirin/uptime-kuma --platform=linux/arm64,linux/amd64 -f dockerfile-owner . --push
