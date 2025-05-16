#!/bin/bash

# Expect that you're running this on a RaspberryPi4

scriptName="$(basename "$0")"
scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dateStamp=$(date --iso-8601="seconds")
tempdir=$(mktemp -d)

function getOsVers () {
	lsb_release --release --short 2>/dev/null
}

function getOsCodename () {
	lsb_release --codename --short 2>/dev/null
}

# Function to cleanup
function cleanup () {
	echo "Deleting temp directory: $tempdir"
	rm -rf "$tempdir"
}
trap cleanup EXIT

function installMinecraftServer () {
	local -r friendlyName="minecraft"

	pushd "${HOME}"
	mkdir spigot 2> /dev/null

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

	# javaBin="${HOME}/java/jdk-17.0.1+12/bin/java"
	javaBin="/usr/bin/java"
	echo "${friendlyName}: building JAR files with \"${javaBin}\""

	# "$javaBin" -jar "$filename" --rev 1.19.3
	"$javaBin" -jar "$filename" --rev 1.21.4
	echo "${friendlyName}: done building JAR files"

	echo "${friendlyName}: CraftBukkit and Spigot are in the same directory as BuildTools.jar"
	popd
}

function uninstallMinecraftServer () {
	local -r friendlyName="minecraft"
	echo "${friendlyName}: uninstalling"

	# TODO
	# sudo apt --purge remove --yes minecraft-launcher
}




_VERBOSE=1

# Debian trixie
if [[ "$(getOsVers)" == "10" || "$(getOsCodename)" == "trixie" ]]; then
	installMinecraftServer
else
	echo "Unrecognized OS version. Not installed pre-requisites."
fi
