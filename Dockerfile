FROM oven/bun:1 AS base
ENV DEVCONTAINER=true
LABEL Name=haxe-bun Version=0.0.1
RUN apt-get -y update \
	&& apt-get install -y git ca-certificates curl python python2 make cmake g++ sudo build-essential gnupg zip libjpeg-dev wget rsync nano libssl-dev pkg-config zlib1g-dev autoconf libtool libcurl4-openssl-dev python-dev chromium libzstd-dev libpng-dev libturbojpeg-dev libvorbis-dev libopenal-dev libsdl2-dev libglu1-mesa-dev libmbedtls-dev libuv1-dev libsqlite3-dev
RUN mkdir -p /temp/hashlink && cd /temp/hashlink && git clone https://github.com/HaxeFoundation/hashlink.git && cd hashlink && make && make install \
	&& curl -fsSL https://bun.sh/install | bash \
	&& bun --global add lix n \
	&& . ~/.bashrc

RUN bunx n 22 \
	&& bunx lix scope create \
	&& bunx lix install haxe 4.3.6

RUN apt-get autoremove -y \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/*
EXPOSE 3000/tcp