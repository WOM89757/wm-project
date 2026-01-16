#/bin/bash

echo "init modelbox"
# 如果modelbox不存在
if [ ! -d "modelbox" ]; then
    # 获取modelbox
    git clone https://github.com/modelbox-ai/modelbox.git
fi

cd modelbox
# git submodule update --init --recursive
mkdir build
cd build
# export CMAKE_PREFIX_PATH=/workspace/wm-project/cpprestsdk-2.10.19/lib64/cmake/cpprestsdk:$CMAKE_PREFIX_PATH
# export LD_LIBRARY_PATH="/workspace/wm-project/cpprestsdk-2.10.19/lib64:$LD_LIBRARY_PATH"
cmake ..
make -j$(nproc)
make package -j$(nproc)


# cd thirdparty/download/modelbox-webui
# npm uninstall @types/lodash
# npm install @types/lodash@4.17.5
# chmod -R u+rwX,go+rX /path/to/dir

# export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
# modelbox-tool develop -s
# modelbox-tool develop -s  --home /workspace/wm_project/deploy-modelbox

# export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
# ./modelbox exec -c conf/modelbox.conf  -fV

# rpm -ivh --force *rpm
# rpm -qa | grep modelbox
#  rpm -e  modelbox-libmodelbox-1.0.0-1.aarch64  modelbox-graph-graphviz-1.0.0-1.aarch64 modelbox-server-1.0.0-1.aarch64 modelbox-ascend-device-flowunit-1.0.0-1.aarch64 modelbox-cpu-device-flowunit-1.0.0-1.aarch64  modelbox-demo-1.0.0-1.aarch64  modelbox-server-devel-1.0.0-1.aarch64  modelbox-modelbox-webui-1.0.0-1.aarch64 modelbox-libmodelbox-devel-1.0.0-1.aarch64  modelbox-document-1.0.0-1.aarch64  modelbox-cpu-device-flowunit-devel-1.0.0-1.aarch64  modelbox-ascend-device-flowunit-devel-1.0.0-1.aarch64

# export MODELBOX_OPTS="-c /usr/local/etc/modelbox/modelbox.conf"
# export MODELBOX_ROOT="/usr/local/etc/modelbox/"
# sudo ln -s /usr/local/etc/modelbox /etc/modelbox
# sudo systemctl start modelbox-manager.service
# sudo systemctl status modelbox.service

# libssl-dev libcpprest-dev
# graphviz 
# libcpprest  boost graphviz 
# apt-get install graphviz libboost-dev  libcpprest

echo "finished build"


# export LD_LIBRARY_PATH="/usr/local/lib64:$LD_LIBRARY_PATH"
# modelbox-tool develop -s
# modelbox-tool develop -s  --home /workspace/wm_project/deploy-modelbox

# export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
# ./modelbox exec -c conf/modelbox.conf  -fV

# rpm -ivh --force *rpm
# rpm -qa | grep modelbox
#  rpm -e  modelbox-libmodelbox-1.0.0-1.aarch64  modelbox-graph-graphviz-1.0.0-1.aarch64 modelbox-server-1.0.0-1.aarch64 modelbox-ascend-device-flowunit-1.0.0-1.aarch64 modelbox-cpu-device-flowunit-1.0.0-1.aarch64  modelbox-demo-1.0.0-1.aarch64  modelbox-server-devel-1.0.0-1.aarch64  modelbox-modelbox-webui-1.0.0-1.aarch64 modelbox-libmodelbox-devel-1.0.0-1.aarch64  modelbox-document-1.0.0-1.aarch64  modelbox-cpu-device-flowunit-devel-1.0.0-1.aarch64  modelbox-ascend-device-flowunit-devel-1.0.0-1.aarch64

# export MODELBOX_OPTS="-c /usr/local/etc/modelbox/modelbox.conf"
# export MODELBOX_ROOT="/usr/local/etc/modelbox/"
# sudo ln -s /usr/local/etc/modelbox /etc/modelbox
# sudo systemctl start modelbox-manager.service
# sudo systemctl status modelbox.service


# modelbox-tool template -project -name yolov5Detecter -template car_detection -path /workspace/wm-project/mb-app/
# modelbox-tool template -flowunit -project-path /workspace/wm-project/mb-app/mnist -name mnist_infer_ascend -lang infer -virtual-type acl  -model ./model.om -input name=in1,device=ascend -output name=out1
# modelbox-tool template -project -name PersonElecFenceInstrusion -template car_detection -path /workspace/wm-project/mb-app/PersonElecFenceInstrusion