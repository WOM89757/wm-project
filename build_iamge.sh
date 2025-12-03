#!/bin/bash

PLATFORM=$1

# 如果PLATFORM为空 则提示用户输入
if [ -z "$PLATFORM" ]; then
    echo "请输入平台类型：ascend nvidia cpu "
    exit 1
fi

# 如果是ascend 则使用Dockerfile-openeuler 否则使用Dockerfile
if [ "$PLATFORM" == "ascend" ]; then
    docker build -f ./docker/ascend/Dockerfile-openeuler -t wm-devlop:latest --build-arg BASE=openeuler/openeuler:24.03-lts-sp1  ./docker/ascend/
    # docker run -e ASCEND_VISIBLE_DEVICES=0 -itd -v /data/wangmao/code/:/workspace -e http_proxy=http://192.168.31.167:1080 -e https_proxy=http://192.168.31.167:1080  --net=host --name wm-devlop wm-devlop:latest
    # docker run -e ASCEND_VISIBLE_DEVICES=0 -itd -v /data/wangmao/code/:/workspace  --net=host --name wm-devlop wm-devlop:latest
else
    docker build -t  wm-devlop:latest  -f Dockerfile  ./
    # docker run -itd -v /home/wangmao/code/:/workspace  --net=host --name wm-devlop wm-devlop:latest
fi

# -e http_proxy=http://192.168.31.167:1080 -e https_proxy=http://192.168.31.167:1080

# docker build -f ./docker/ascend/Dockerfile-openeuler -t wm-devlop:latest --build-arg BASE=openeuler/openeuler:24.03-lts-sp1  ./docker/ascend/

# docker build -t  wm-devlop:latest  -f Dockerfile  ./

# docker run -itd -v /home/wangmao/code/:/workspace -e http_proxy=http://192.168.31.167:1080 -e https_proxy=http://192.168.31.167:1080  --name wm-devlop wm-devlop:latest