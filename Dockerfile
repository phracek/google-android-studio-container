FROM fedora:25
MAINTAINER Petr Hracek <phracek@redhat.com>

RUN dnf install -y zip ant glibc glibc.i686 glibc-devel.i686 \
    zlib-devel.i686 zlib-devel.i686 libstdc++.i686 \
    ncurses-devel.i686 SDL.i686 \
    libX11-devel.i686 libX11 libXrandr.i686 libXrender.i686 \
    xz-libs.i686 libXxf86vm libXdamage.i686 libXfixes.i686 \
    android-tools
ARG USER_ID=1000
RUN useradd -o -u ${USER_ID} -G video android
RUN mkdir -p /data
RUN curl --progress-bar -o /data/android-studio-ide-162.4069837-linux.zip https://dl.google.com/dl/android/studio/ide-zips/2.3.3.0/android-studio-ide-162.4069837-linux.zip
RUN unzip /data/android-studio-ide-162.4069837-linux.zip -d /home/android

RUN curl --progress-bar -o /data/sdk-tools-linux-3859397.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
RUN unzip /data/sdk-tools-linux-3859397.zip -d /home/android/android-studio  

RUN rm -f /data/*
USER android
# change if your user ID is different
ENV HOME /home/android

CMD ["/home/android/android-studio/bin/studio.sh"]
