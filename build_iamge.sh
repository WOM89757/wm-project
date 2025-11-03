docker build -t  wm-devlop:latest  -f Dockerfile  ./

# docker run -it -v /home/wangmao/code/:/workspace -e http_proxy=http://192.168.31.167:1080 -e https_proxy=http://192.168.31.167:1080  --name wm-devlop wm-devlop:latest
# docker run -it -v /home/wangmao/code/:/workspace --name wm-devlop wm-devlop:latest