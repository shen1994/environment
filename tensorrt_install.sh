sudo apt-get -y install python-pip
sudo apt-get -y install python3-pip
sudo pip install Cython-0.29.15-py2.py3-none-any.whl
sudo pip3 install Cython-0.29.15-py2.py3-none-any.whl
sudo pip install numpy-1.16.6-cp27-cp27mu-manylinux1_x86_64.whl
sudo pip3 install numpy-1.18.4-cp35-cp35m-manylinux1_x86_64.whl
sudo pip install protobuf-3.11.3-cp27-cp27mu-manylinux1_x86_64.whl
sudo pip3 install protobuf-3.11.3-cp35-cp35m-manylinux1_x86_64.whl
tar -zxvf TensorRT-6.0.1.5.Ubuntu-16.04.x86_64-gnu.cuda-10.1.cudnn7.6.tar.gz
sudo mv TensorRT-6.0.1.5 /usr/local/
cd /usr/local/TensorRT-6.0.1.5
sudo sed -i '$a export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu' ~/.bashrc 
sudo sed -i '$a export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/TensorRT-6.0.1.5/lib' ~/.bashrc
source ~/.bashrc
cd /usr/local/TensorRT-6.0.1.5/python
sudo pip install tensorrt-6.0.1.5-cp27-none-linux_x86_64.whl
sudo pip3 install tensorrt-6.0.1.5-cp35-none-linux_x86_64.whl
cd /usr/local/TensorRT-6.0.1.5/uff
sudo pip install uff-0.6.5-py2.py3-none-any.whl
sudo pip3 install uff-0.6.5-py2.py3-none-any.whl
which convert-to-uff
cd /usr/local/TensorRT-6.0.1.5/graphsurgeon
sudo pip2 install graphsurgeon-0.4.1-py2.py3-none-any.whl
sudo pip3 install graphsurgeon-0.4.1-py2.py3-none-any.whl




