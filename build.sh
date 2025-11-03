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