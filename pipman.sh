cd /home/westwell

sudo mkdir .pip
sudo echo '[global]' >> ~/.pip/pip.conf
sudo echo 'index-url = https://pypi.tuna.tsinghua.edu.cn/simple' >> ~/.pip/pip.conf
sudo echo '[install]' >> ~/.pip/pip.conf
sudo echo 'trusted-host=mirrors.aliyun.com' >> ~/.pip/pip.conf

sudo mkdir .pip3
sudo echo '[global]' >> ~/.pip3/pip3.conf
sudo echo 'index-url = https://pypi.tuna.tsinghua.edu.cn/simple' >> ~/.pip3/pip3.conf
sudo echo '[install]' >> ~/.pip3/pip3.conf
sudo echo 'trusted-host=mirrors.aliyun.com' >> ~/.pip3/pip3.conf
