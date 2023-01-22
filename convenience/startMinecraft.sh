#!/bin/bash

pushd ${HOME}/minecraft
screen "${HOME}/java/jdk-17.0.1+12/bin/java" -jar \
    -Xms4G \ # maximum memory allocation pool for a Java Virtual Machine (JVM)
    -Xmx4G \ # initial memory allocation pool
    spigot-1.19.3.jar nogui
popd
