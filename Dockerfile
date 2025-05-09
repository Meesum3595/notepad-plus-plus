# Dockerfile
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# 1) Install Wine, wget, unzip, Xvfb
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      wget \
      unzip \
      wine32 \
      xvfb \
 && rm -rf /var/lib/apt/lists/*

# 2) Download & unpack portable Notepad++
WORKDIR /opt
RUN wget -q https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.5.1/npp.8.5.1.portable.x64.zip \
 && unzip -q npp.8.5.1.portable.x64.zip -d npp \
 && rm npp.8.5.1.portable.x64.zip

# 3) Prepare Wine prefix for Windows 10
ENV WINEPREFIX=/root/.wine \
    WINEARCH=win64
RUN winecfg -v win10

# 4) Launch Notepad++ under Wine
ENTRYPOINT ["wine", "/opt/npp/notepad++.exe"]
