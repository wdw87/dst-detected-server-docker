import os
import sys
import re
#docker-compose.yml文件模板
service_format = '''
version: '2.0'
services:
  dst_caves:
    image: wdw87/dst-detected-server:latest
    ports:
      - "10998:10998/udp"
    networks:
     - dst_cluster
    links:
     - dst_master
    volumes:
    volumes:
     - "{base_path}:/home/steam/.klei/DoNotStarveTogether/Cluster_1"
     - "{mods_path}:/home/steam/dst/mods/dedicated_server_mods_setup.lua"
    container_name: dst_caves
    environment:
      - SHARD_NAME=Caves


  dst_master:
    image: wdw87/dst-detected-server:latest
    ports:
      - "10999:10999/udp"
    networks:
     - dst_cluster
    volumes:
    volumes:
     - "{base_path}:/home/steam/.klei/DoNotStarveTogether/Cluster_1"
     - "{mods_path}:/home/steam/dst/mods/dedicated_server_mods_setup.lua"
    container_name: dst_master
    environment:
      - SHARD_NAME=Master

    stdin_open: true
    tty: true

networks:
  dst_cluster:
'''
#cluster.init文件模板
cluster_ini = ""

#dedicated_server_mods_setup.lua 文件模板
dedicated_server_mods_setup = '''
--加载Mod在这里，按照官方的格式如
--ServerModSetup("350811795")
--记得加入对应的modoverrides.lua配置信息到./Master和./Caves里

'''
#modoverrides.lua 文件模板
modoverrides = '''
return {{
    {mod_configs}
}}
'''

#获取脚本所在目录
path = "/".join(os.path.abspath(sys.argv[0]).split("/")[0:-1])
print(path)

#解析 info.ini
text = []
name = []
password = []
description = []
token = []
game_mode = []
with open(path + "/info.ini", 'r') as f:
    text = f.read()
text = re.sub("\s?#.*", "", text)
for line in text.split("\n"):
    if line != "":
        info = line.split(',')
        name = info[0]
        password = info[1]
        description = info[2]
        game_mode = info[3]
        token = info[4]
print("info:\n" + \
      "\tname: " + name + \
      "\n\tpassword: " + password + \
      "\n\tdescription： " + description + \
      "\n\tgame mode: " + game_mode + \
      "\n\ttoken: " + token)

#解析 mods.ini
mods = []
with open(path + "/mods.ini", 'r') as f:
    text = f.read();
text = re.sub("\s?#.*", "", text)
for line in text.split("\n"):
    if line != "":
        mods.append(line)

mod_configs = ""
for mod in mods:
    dedicated_server_mods_setup = dedicated_server_mods_setup + "ServerModSetup(\"" + mod + "\")\n"
    mod_configs = mod_configs + "\t[\"workshop-" + mod + "\"] = { enabled = true },\n"
mod_configs = mod_configs[:-2] + "\n"
modoverrides = modoverrides.format(
    mod_configs = mod_configs
)
print("已加载mods:")
for mod in mods:
    print("\t" + mod)



# 生成docker-compose.yml
base_data_path = path + '/data'
data_path = base_data_path + "/" + name
print('创建data目录： ' + data_path)
os.system('mkdir -p ' + data_path)

docker_compose_yml = service_format.format(
    base_path = data_path,
    mods_path = data_path + '/dedicated_server_mods_setup.lua'
)
print("生成" + base_data_path + "/docker-compose.yml")
with open(base_data_path + "/docker-compose.yml", "w") as f:
    f.write(docker_compose_yml)

#dst配资相关
os.system("mkdir -p " + data_path + "/Master")
os.system("mkdir -p " + data_path + "/Caves")
master_world_abspath = '/Master/leveldataoverride.lua'
cave_world_abspath = '/Caves/leveldataoverride.lua'
mod_setting_abspath = '/mods/modoverrides.lua'

#写入token
with open(data_path + "/cluster_token.txt", "w") as f:
    f.write(token)

#生成cluster.ini文件
with open(path + '/template/cluster.ini', "r") as f:
    cluster_ini = re.sub("\s?#.*", "", cluster_ini)
    cluster_ini = f.read()
cluster_ini = re.sub("\s?#.*", "", cluster_ini)
cluster_ini = cluster_ini.format(
    name = name,
    password = password,
    description = description,
    game_mode = game_mode
)
with open(data_path + "/cluster.ini", "w") as f:
    f.write(cluster_ini)

#复制世界配置相关文件worldgenoverride.lua和server.ini
os.system('cp -f ' + path + '/template' + master_world_abspath + ' ' + data_path + master_world_abspath)
os.system('cp -f ' + path + '/template' + cave_world_abspath + ' ' + data_path + cave_world_abspath)
os.system('cp -f ' + path + '/template/Master/server.ini' + ' ' + data_path + '/Master/server.ini')
os.system('cp -f ' + path + '/template/Caves/server.ini' + ' ' + data_path + '/Caves/server.ini')
# 生成mod配置文件
with open(data_path + "/dedicated_server_mods_setup.lua", "w") as f:
    f.write(dedicated_server_mods_setup)
with open(data_path + "/Master/modoverrides.lua", "w") as f:
    f.write(modoverrides)
with open(data_path + "/Caves/modoverrides.lua", "w") as f:
    f.write(modoverrides)
# #复制mod配置文件
# os.system('cp -f ' + path + '/template' + mod_setting_abspath + ' ' + path + '/data/Master/modoverrides.lua')
# os.system('cp -f ' + path + '/template' + mod_setting_abspath + ' ' + path + '/data/Caves/modoverrides.lua')
print("配置完成！！")