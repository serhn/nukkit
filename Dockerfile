FROM openjdk:8u212-jre-alpine
RUN wget https://ci.nukkitx.com/job/NukkitX/job/Nukkit/job/master/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar

#RUN useradd --user-group \
            --no-create-home \
            --home-dir /data \
            --shell /usr/sbin/nologin \
            minecraft

#RUN chown -R minecraft:minecraft /nukkit-1.0-SNAPSHOT.jar

EXPOSE 19132
#USER minecraft:minecraft
ENTRYPOINT ["java"]
CMD ["-Xms1G","-Xmx1G","-jar","/nukkit-1.0-SNAPSHOT.jar"]
