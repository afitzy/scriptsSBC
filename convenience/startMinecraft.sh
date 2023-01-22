#!/bin/bash

# Upgrading world
# First upgrade your world completely on OLD_VERSION using the --forceUpgrade server argument, and then do the same on NEW_VERSION.
# Ref: https://www.spigotmc.org/threads/bukkit-craftbukkit-spigot-bungeecord-1-14-4-development-builds.369724/
# pushd ${HOME}/minecraft && screen "${HOME}/java/jdk-17.0.1+12/bin/java" -jar -Xms1024M -Xmx2048M spigot-1.19.3.jar --forceUpgrade --eraseCache nogui

pushd ${HOME}/minecraft
screen "${HOME}/java/jdk-17.0.1+12/bin/java" -jar \
    -Xms1024M \ # maximum memory allocation pool for a Java Virtual Machine (JVM)
    -Xmx2048M \ # initial memory allocation pool
    spigot-1.19.3.jar nogui
popd
