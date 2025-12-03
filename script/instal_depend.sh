#安装依赖


if [ "$PLATFORM" == "ascend" ]; then
  echo "ascend platform"
  yum update
  yum install git libatomic freetype-devel boost boost-devel -y

  yum groupinstall -y "Development Tools"
  yum install -y cmake git wget curl npm python3 python3-pip python3-devel openssl-devel graphviz-devel ffmpeg ffmpeg-devel opencv-devel 
  yum install -y cpprest-devel

  yum install boost boost-devel libatomic python3-devel -y

  yum install libatomic git openssl-devel npm net-tools graphviz-devel protobuf-c-devel openssh-server rpm-build wget boost-devel vim   python3-devel python3-perf  cpp-httplib passwd  -y
  
  yum install openssl openssl-devel

  # 下载 nvm 安装脚本
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

  # 让 nvm 生效
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  # 安装 Node.js（会自动包含 npm）
  nvm install 12

  # 验证安装
  node -v
  npm -v

  ln -s $(which npm) /usr/bin/npm

  npm install ngx-showdown
  npm install showdown
  npm install webpack

  # cd thirdparty/download/modelbox-webui
  # npm uninstall @types/lodash
  # npm install @types/lodash@4.17.5
  # cd ../../../

  # /usr/local/Ascend/FFmpeg-n4.4.4/ascend/lib/
  # export LD_LIBRARY_PATH=/usr/local/Ascend/FFmpeg-n4.4.4/ascend/lib/:$LD_LIBRARY_PATH
  
  # yum install -y ffmpeg ffmpeg-devel
  # bash -c 'echo "/usr/include/ffmpeg" > /etc/ld.so.conf.d/ffmpeg-include.conf'
  # ldconfig
  # cmake .. -DCMAKE_CXX_FLAGS="-I/usr/include/ffmpeg"

  # pip install wheel
  # python3 -m pip install --upgrade pip setuptools wheel



  # sudo yum install git cmake gcc-c++ boost-devel openssl-devel -y
  # git clone https://github.com/microsoft/cpprestsdk.git
  # cd cpprestsdk
  # mkdir build && cd build
  # cmake .. -DCMAKE_BUILD_TYPE=Release
  # make -j$(nproc)
  # sudo make install

  # yum remove nodejs npm -y

  git clone https://github.com/microsoft/cpprestsdk.git
  cd cpprestsdk
  git checkout -b v2.10.19
  mkdir build
  cd build
  cmake -DWERROR=OFF -DCPPREST_EXCLUDE_WEBSOCKETS=ON -DCPPREST_EXCLUDE_COMPRESSION=ON -D CMAKE_INSTALL_PREFIX=./install/  ..
  make 



  exit 0
fi

# 如果npm 版本是6.14.16 node 是12.22.12 则进行不安装
if [ "$(npm -v)" = "6.14.16" ] && [ "$(node -v)" = "v12.22.12" ]; then
  echo "npm and node are already installed."
  exit 0
fi

# 移除旧版本
sudo apt remove nodejs npm -y
sudo apt autoremove -y
sudo apt purge nodejs npm -y

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 12
# Verify the Node.js version:
node -v 
# Should print "v12.22.12".
# Verify npm version:
npm -v 
# Should print "6.14.16".

sudo ln -s $(which npm) /usr/bin/npm

npm install ngx-showdown
npm install showdown
   
   


# 安装流媒体服务
# docker run -id -p 1935:1935 -p 8080:80 -p 8443:443 -p 8554:554 -p 30061-30091:30061-30091 -p 10000:10000/udp -p 8000:8000/udp -p 9000:9000/udp --name alg-dev-mediakit zlmediakit/zlmediakit:master

# ffmpeg -stream_loop -1  -re -i .\smoke.mp4   -vcodec h264 -acodec aac -f rtsp -rtsp_transport tcp rtsp://192.168.31.167:8554/live/test





