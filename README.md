## Python 3 Coding, Minecraft server pockert edition


Start server select Language

```sh
docker run --name=nukkit \
     -it \
     --restart=unless-stopped \
     serh/nukkit
 ```
 

Copy volume

```sh
docker cp nukkit:/nukkit ./data
 ```
 
Delete container
 
```sh
docker rm -f nukkit
```

Create, restart script

nukkit.sh

```sh
#/bin/sh
PASSWORD=YOUR_SSH_PASSWORD
docker rm -f nukkit
docker run --name=nukkit \
     -p 19132:19132/udp \
     -p 8822:22 \
     -itd \
     --restart=unless-stopped \
     -v ${PWD}/data:/nukkit \
     serh/nukkit
docker exec -u 0 nukkit  bash -c '/etc/init.d/ssh start'
docker exec -u 0 nukkit  bash -c "echo -e \"${PASSWORD}\n${PASSWORD}\" | passwd nukkit"
```


https://habr.com/ru/post/472614/

https://nukkitx.com/resources/pokkit.21/

https://github.com/denisglotov/RaspberryJuice/releases/tag/1.11.pe


