sudo apt update && sudo apt install \
    build-essential \
    cmake \
    g++-10 \
    libayatana-appindicator3-dev \
    libavdevice-dev \
    libboost-filesystem-dev \
    libboost-locale-dev \
    libboost-log-dev \
    libboost-program-options-dev \
    libcap-dev \

sudo apt install -y \
    libdrm-dev \
    libevdev-dev \
    libmfx-dev \
    libnotify-dev \
    libnuma-dev \
    libopus-dev \
    libpulse-dev \
    libssl-dev \
    libva-dev \

sudo apt install -y \
    libvdpau-dev \
    libwayland-dev \
    libx11-dev \
    libxcb-shm0-dev \
    libxcb-xfixes0-dev \
    libxcb1-dev \
    libxfixes-dev \
    libxrandr-dev \
    libxtst-dev \
    nodejs \
    npm \
    wget

sudo apt-get install libcurl4-openssl-dev libminiupnpc-dev


set -e
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source "$HOME/.nvm/nvm.sh"
nvm install 20.9.0
nvm use 20.9.0

set -e
sudo update-alternatives --install \
  /usr/bin/gcc gcc /usr/bin/gcc-10 100 \
  --slave /usr/bin/g++ g++ /usr/bin/g++-10 \
  --slave /usr/bin/gcov gcov /usr/bin/gcov-10 \
  --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-10 \
  --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-10

git submodule update --init --recursive

mkdir build && cd build
cmake .. && make -j4
sudo cp -r assets /usr/local/