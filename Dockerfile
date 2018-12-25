FROM ubuntu
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y xz-utils
# RUN cd tmp
# RUN wget https://www.factorio.com/get-download/stable/headless/linux64
COPY ./files /tmp
WORKDIR /opt
RUN tar -xJf /tmp/factorio_headless_x64_0.16.51.tar.xz

RUN useradd factorio
RUN chown -R factorio:factorio /opt/factorio

RUN mkdir /opt/factorio/saves
RUN mv /tmp/ninjatown.zip /opt/factorio/saves/ninjatown.zip
RUN mv /tmp/server-settings.json /opt/factorio/data/server-settings.json

EXPOSE 34197
ENTRYPOINT ["/opt/factorio/bin/x64/factorio", "--start-server", "/opt/factorio/saves/ninjatown.zip"]