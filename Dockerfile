FROM ubuntu:20.04

# 设置时区和避免交互式安装
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# 更新包索引并安装基础工具
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt update && \
    apt install -y apt-utils && \
    # 安装开发工具链
    apt install -y \
        build-essential \
        cmake \
        autoconf \
        automake \
        libtool \
        pkg-config \
        git \
        vim \
        nano \
        curl \
        wget \
        unzip \
        tar \
        gzip \
        sudo \
        bash \
        gdb \
        doxygen \
        clang \
        clang-tidy \
        ccache && \
    # 安装依赖库
    apt install -y \
        libssl-dev \
        libcurl4-openssl-dev \
        libcpprest-dev \
        libprotobuf-dev \
        protobuf-compiler \
        duktape-dev \
        libgtk-3-dev \
        libswscale-dev \
        libavformat-dev \
        libavcodec-dev \
        libavutil-dev \
        ffmpeg \
        libfuse-dev \
        libgraphviz-dev \
        graphviz \
        libtbb-dev \
        libgoogle-glog-dev \
        libboost-all-dev \
        cmake git wget build-essential npm curl && \
    # 清理缓存
    rm -rf /var/lib/apt/lists*

# 安装Python及相关包
RUN apt update && \
    apt install -y python3 python3-dev python3-pip python3-setuptools \
    python3 python3-pip python-is-python3 \
    libssl-dev libcpprest-dev libopencv-dev libgraphviz-dev python3-dev \
    libavfilter-dev libavdevice-dev libavcodec-dev   &&  \
    ln -sf python3 /usr/bin/python && \
    ln -sf pip3 /usr/bin/pip && \
    python -m pip install --upgrade pip && \
    pip install psutil pillow wheel numpy pyyaml requests opencv-python -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    npm config set registry https://registry.npmmirror.com  && \
    rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /workspace

# 设置环境变量
ENV CC=/usr/bin/clang
ENV CXX=/usr/bin/clang++
ENV CCACHE_DIR=/workspace/.ccache

# 创建非root用户
RUN useradd -m -s /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 切换到开发者用户
USER developer

# 设置默认命令
CMD ["/bin/bash"]