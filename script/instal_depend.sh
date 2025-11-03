#安装依赖

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





