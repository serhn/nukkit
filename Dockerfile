FROM openjdk:8u342-jre

RUN apt-get update && apt-get install -y git python3-pip vim openssh-server

RUN wget https://ci.nukkitx.com/job/NukkitX/job/Nukkit/job/master/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar

RUN adduser --home /nukkit --disabled-password --gecos '' nukkit

USER nukkit

RUN mkdir -p /nukkit/plugins/Pokkit/bukkitPlugins/

# SRC https://github.com/PetteriM1/Pokkit
#File download from from browser wget not work  https://nukkitx.com/resources/pokkit.21/download
RUN wget -O /nukkit/plugins/Pokkit-0.9.3.jar  https://github.com/serhn/nukkit/raw/master/Pokkit-0.9.3.jar

RUN wget -O /nukkit/plugins/Pokkit/bukkitPlugins/raspberryjuice-1.11.pe.jar https://github.com/denisglotov/RaspberryJuice/releases/download/1.11.pe/raspberryjuice-1.11.pe.jar

WORKDIR /nukkit

RUN mkdir /nukkit/lib
RUN cd /nukkit/lib
RUN git clone https://github.com/py3minepi/py3minepi.git && cd py3minepi && pip3 install --user .


EXPOSE 19132

ENTRYPOINT ["java"]

CMD ["-Xms1G","-Xmx1G","-jar","/nukkit-1.0-SNAPSHOT.jar"]

