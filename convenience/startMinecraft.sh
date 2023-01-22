#!/bin/bash

pushd ${HOME}/minecraft
screen "${HOME}/java/jdk-17.0.1+12/bin/java" -jar -Xms512M -Xmx2048M spigot-1.19.3.jar nogui
popd
