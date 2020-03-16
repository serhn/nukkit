FROM openjdk:8u212-jre-alpine
RUN wget https://ci.nukkitx.com/job/NukkitX/job/Nukkit/job/master/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar && java -Xms1G -Xmx1G -jar nukkit-1.0-SNAPSHOT.jar
