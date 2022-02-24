docker login --username=yunpeng@burgeon-zhizao registry.cn-shanghai.aliyuncs.com
buildx create --use --name uptime-kuma
docker buildx inspect uptime-kuma --bootstrap
docker buildx build -f dockerfile-owner --platform=linux/arm64,linux/amd64 -t registry.cn-shanghai.aliyuncs.com/r3-dev/uptime-kuma:v20200224 . --push
docker buildx build -t ccr.ccs.tencentyun.com/plusirin/uptime-kuma --platform=linux/arm64,linux/amd64 -f dockerfile-owner . --push
