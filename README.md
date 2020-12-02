# dst-detected-server-docker

## 运行环境

### Python3

1. 安装依赖

~~~bash
yum -y groupinstall "Development tools"
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel
yum -y install libffi-devel 
~~~

2. 下载python3安装包

~~~bash
wget https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tar.xz
~~~

3. 新建python3目录

~~~bash
mkdir /usr/local/python3
~~~

4. 安装python3并创建软连接

~~~bash
tar -xvJf  Python-3.8.5.tar.xz
cd Python-3.8.5
./configure --prefix=/usr/local/python3
make && make install
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
~~~

### Docker

1. 安装docker-ce

可以使用脚本自动安装

~~~bash
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
~~~

~~~bash
systemctl enable docker
systemctl start docker
~~~

2. 安装docker-compose

~~~bash
sudo curl -L "https://get.daocloud.io/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose && \
docker-compose --version
~~~

## 使用说明

### 详细步骤

1. Clone项目

~~~bash
git clone --depth=1 https://github.com/wdw87/dst-detected-server-docker.git
~~~

2. 进入目录

~~~bash
cd dst-detected-server-docker/
~~~

3. 根据注释修改配置文件info.ini和mods.ini

4. 执行生成脚本

~~~bash
python3 start.py
~~~

5. 修改权限（重要）

~~~bash
chmod -R a+w ./data/
~~~

5. 启动容器

~~~bash
cd data/
docker-compose up
~~~

ps:这一步需要从docker Hub上拉去镜像，如果速度缓慢，可以尝试自己构建镜像，构建完成后再进行docker-compose up，构建方法：

~~~bash
cd ../docker/
docker build -t wdw87/dst-detected-server:latest .
~~~



### 容器启动与停止

启动主世界

~~~bash
docker start dst_master -d
~~~

启动洞穴

~~~bash
docker start dst_caves -d
~~~

停止主世界

~~~bash
docker stop dst_master -d
~~~

停止洞穴

~~~bash
docker stop dst_caves -d
~~~

### 日志查看

查看主世界日志

~~~bash
docker-compose logs -f --tail=300 dst_master
~~~

查看洞穴日志

~~~bash
docker-compose logs -f --tail=300 dst_caves
~~~



### 关于地图生成配置以及mod

地图配置请在执行start.py前修改/template/Master/leveldataoverride.lua和/template/Caves/leveldataoverride.lua
推荐在本地启动服其配置好地图相关参数后直接用本地生成的文件覆盖

mods.ini在执行start.py前前生效，如果游戏中想添加mod，需要手动修改/data中对应的文件
