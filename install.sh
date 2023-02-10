#!/bin/bash

red="\e[;31m"
green="\e[;32m"
default="\e[0m"
if [[$1='-i']]
then
    apt update
    echo -e "Instalando Snort..."
    echo -e "Instalando dependencias... [ En proceso ]"
    apt install build-essential libpcap-dev libpcre3-dev libnet1-dev zlib1g-dev luajit hwloc libdnet-dev libdumbnet-dev bison flex liblzma-dev openssl libssl-dev pkg-config libhwloc-dev cmake cpputest libsqlite3-dev uuid-dev libcmocka-dev libnetfilter-queue-dev libmnl-dev autotools-dev libluajit-5.1-dev libunwind-dev libfl-dev -y
    clear
    echo -e "Instalando Snort..."
    echo -e "Instalando dependencias... [ ${green}Instaladas${default} ]"
    echo -e "Instalando Git [ En proceso ]"
    apt install git
    clear 
    echo -e "Instalando Snort..."
    echo -e "Instalando dependencias... [ ${green}Instaladas${default} ]"
    echo -e "Instalando Git [ ${green}Instalado${default} ]"
    echo -e "Descargando el paquete de SnortDAQ [ En proceso ]"
    git clone https://github.com/snort3/libdaq.git
    clear
    echo -e "Instalando Snort..."
    echo -e "Instalando dependencias... [ ${green}Instaladas${default} ]"
    echo -e "Instalando Git [ ${green}Instalado${default} ]"
    echo -e "Descargando el paquete de SnortDAQ [ ${green}Descargado${default} ]"
    echo -e "Configurando instalacion [ En proceso ]"
    cd libdaq
    ./bootstrap
    ./configure
    make
    make install
    clear
    echo -e "Instalando Snort..."
    echo -e "Instalando dependencias... [ ${green}Hecho${default} ]"
    echo -e "Instalando Git [ ${green}Hecho${default} ]"
    echo -e "Descargando el paquete de SnortDAQ [ ${green}Hecho${default} ]"
    echo -e "Configurando instalacion [ ${green}Hecho${default} ]"
    echo -e "Instalando Gperftools [ En proceso ]"
    cd ..
    wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.9.1/gperftools-2.9.1.tar.gz
    tar xzf gperftools-2.9.1.tar.gz
    cd gperftools-2.9.1/
    ./configure
    make
    make install
    echo -e "Instalando Snort..."
    echo -e "Instalando dependencias... [ ${green}Hecho${default} ]"
    echo -e "Instalando Git [ ${green}Hecho${default} ]"
    echo -e "Descargando el paquete de SnortDAQ [ ${green}Hecho${default} ]"
    echo -e "Configurando instalacion [ ${green}Hecho${default} ]"
    echo -e "Instalando Gperftools [ ${green}Hecho${default} ]"
    echo -e "Descargando el paquete de Snort [ En proceso ]"
    cd ..
    wget https://github.com/snort3/snort3/archive/refs/tags/3.1.43.0.tar.gz
    tar -xvzf 3.1.43.0.tar.gz
    cd snort3-3.1.43.0
    ./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc
    cd build
    make
    make install
    ldconfig
    echo -e "Instalando Snort..."
    echo -e "Instalando dependencias... [ ${green}Hecho${default} ]"
    echo -e "Instalando Git [ ${green}Hecho${default} ]"
    echo -e "Descargando el paquete de SnortDAQ [ ${green}Hecho${default} ]"
    echo -e "Configurando instalacion [ ${green}Hecho${default} ]"
    echo -e "Instalando Gperftools [ ${green}Hecho${default} ]"
    echo -e "Descargando el paquete de Snort [ ${green}Hecho${default} ]"
    echo -e "${green}Instalacion completada${default}"
    exit
else
    echo -e "${red}Especifica una funcion ${default}"
fi
