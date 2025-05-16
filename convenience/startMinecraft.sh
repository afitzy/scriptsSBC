#!/bin/bash

# Upgrading world
# First upgrade your world completely on OLD_VERSION using the --forceUpgrade server argument, and then do the same on NEW_VERSION.
# Ref: https://www.spigotmc.org/threads/bukkit-craftbukkit-spigot-bungeecord-1-14-4-development-builds.369724/
# Ref: https://www.spigotmc.org/threads/spigot-bungeecord-1-19-3.581396/
# pushd ${HOME}/minecraft && screen "${HOME}/java/jdk-17.0.1+12/bin/java" -jar -Xms1024M -Xmx2048M spigot-1.19.3.jar --forceUpgrade --eraseCache nogui

pushd ${HOME}/spigot
javaBin="/usr/bin/java"
screenSessionName="minecraftSpigot"
screen -d -m -S "$screenSessionName" "$javaBin" \
    -Xms1G \ # maximum memory allocation pool for a Java Virtual Machine (JVM)
    -Xmx2G \ # initial memory allocation pool
    -XX:+UseG1GC \
    -jar spigot-1.21.5.jar nogui
popd
