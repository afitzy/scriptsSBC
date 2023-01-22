#!/bin/bash

pushd ${HOME}/minecraft
screen "${HOME}/java/jdk-17.0.1+12/bin/java" -jar \
    -Xms512M \ # maximum memory allocation pool for a Java Virtual Machine (JVM)
    -Xmx2048M \ # initial memory allocation pool
    spigot-1.19.3.jar nogui
popd
