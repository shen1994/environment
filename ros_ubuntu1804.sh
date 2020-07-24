# 1. base tools install 
sudo apt-get update
sudo apt-get -y install vim
sudo apt-get -y install net-tools
sudo apt-get -y install openssh-server
sudo apt-get -y install cmake gcc g++
sudo apt-get -y install terminator

# 2. disable ubuntu driver 
sudo vim /etc/modprobe.d/blacklist-nouveau.conf
### add to file
blacklist nouveau
options nouveau modeset=2
###
sudo update-initramfs -u
sudo reboot

# 3. install nvidia driver
sudo ./NVIDIA-Linux-x86_64-418.88.run

# 4. cuda and cudnn install
sudo ./cuda_10.1.243_418.87.00_linux.run
sudo dpkg -i libcudnn7_7.5.0.56-1+cuda10.1_amd64.deb
sudo dpkg -i libcudnn7-dev_7.5.0.56-1+cuda10.1_amd64.deb
sudo vim ~/.bashrc
### add to file
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
###
source ~/.bashrc

# 5. python based install
sudo apt-get clean 
sudo apt update
sudo apt install -y apt-utils git 
sudo apt install -y python-dev python-pip python-setuptools
sudo apt install -y python3-dev python3-pip python3-setuptools
sudo apt install -y psmisc
sudo apt install -y iputils-ping lsb-release
sudo pip3 install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple
sudo pip3 install opencv-python -i https://pypi.tuna.tsinghua.edu.cn/simple

# 6. opencv install 
unzip opencv-3.4.3.zip && mv opencv-3.4.3 /home/westwell
cd /home/westwell/opencv-3.4.3
mkdir build && cd build 
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=ON -D BUILD_opencv_cudacodec=OFF ..
make -j$(nproc)
sudo make install
rm -rf /home/westwell/opencv-3.4.3

# 7. torch-1.4.0 install
sudo pip3 install torch-1.4.0-cp36-cp36m-manylinux1_x86_64.whl
sudo pip3 install torchvision==0.5.0 -i https://pypi.tuna.tsinghua.edu.cn/simple

# extra: using other source list
# it's very dangerous
#sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# 8. ros1 install
export DEBIAN_FRONTEND=noninteractive
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt-get install -y ros-melodic-desktop-full
sudo apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

# 9. ros2 install
sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt update
sudo apt install -y curl gnupg2
curl -s http://repo.ros2.org/repos.key | sudo apt-key add -
sudo sh -c 'echo "deb  http://mirror.tuna.tsinghua.edu.cn/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
sudo apt update
sudo apt install -y ros-dashing-desktop
sudo apt install -y python3-argcomplete 
sudo apt install -y python3-colcon-common-extensions
sudo apt install -y ros-dashing-launch-testing-ament-cmake
sudo apt install -y ros-dashing-ros2bag ros-dashing-rosbag2*
sudo apt install -y ros-dashing-rmw-opensplice-cpp
sudo apt install -y ros-dashing-rmw-connext-cpp

# 10. Pangolin
sudo apt-get install libgl1-mesa-dev
sudo apt-get install libglew-dev
sudo apt-get install libxkbcommon-x11-dev
tar -zxvf Pangolin.tar.gz
cd Pangolin && mkdir build && cd build
cmake .. && cmake --build .
# cmake --build . --target doc
cd .. && cd ..
rm -rf Pangolin

