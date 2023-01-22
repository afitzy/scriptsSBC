#!/bin/bash

# Expect that you're running this on a RaspberryPi4

scriptName="$(basename "$0")"
scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dateStamp=$(date --iso-8601="seconds")
tempdir=$(mktemp -d)

source "${scriptDir}/../utils.sh"

# Function to cleanup
function cleanup () {
	log "Deleting temp directory: $tempdir"
	rm -rf "$tempdir"
}
trap cleanup EXIT

function installMinecraftServer () {
	local -r friendlyName="minecraft"

	# Procedure ref: https://www.spigotmc.org/wiki/buildtools/#linux

	# Download BuildTools.jar
	local -r url="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
	local urlFilename="${url##*/}"
	urlFilename="${urlFilename%%\?*}"
	# local -r filename="${tempdir}/${urlFilename}"
	local -r filename="${urlFilename}"

	echo "${friendlyName}: downloading $urlFilename"
	wget --output-document="$filename" "$url"

	git config --global --unset core.autocrlf

	# Ref: https://www.spigotmc.org/wiki/buildtools/#latest
	echo "${friendlyName}: building JAR files"
	java -jar "$filename" --rev 1.19.3

	echo "${friendlyName}: done building JAR files"
	echo "${friendlyName}: CraftBukkit and Spigot are in the same directory as BuildTools.jar"
}

function uninstallMinecraftServer () {
	local -r friendlyName="minecraft"
	echo "${friendlyName}: uninstalling"

	# TODO
	# sudo apt --purge remove --yes minecraft-launcher
}




_VERBOSE=1

if [[ "$(getOsVers)" == "16.04" || "$(getOsVers)" == "18.04" || "$(getOsVers)" == "20.04" || "$(getOsVers)" == "22.04" ]]; then
	installMinecraftServer
else
	echo "Unrecognized OS version. Not installed pre-requisites."
fi
