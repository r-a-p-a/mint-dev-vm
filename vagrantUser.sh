#!/bin/bash -eu

export DEBIAN_FRONTEND=noninteractive

cp /usr/share/applications/eclipse.desktop ~/Desktop/eclipse.desktop
chmod +x ~/Desktop/eclipse.desktop
cp /usr/share/applications/vscode.desktop ~/Desktop/vscode.desktop
chmod +x ~/Desktop/vscode.desktop
echo " ==> Created desktop launchers"

if [ -z "$(pidof -s cinnamon)" ]; then
	sleep 10
fi
PID=$(pidof -s cinnamon)

if [ -z "${DBUS_SESSION_BUS_ADDRESS-}" ]; then
	QUERY_ENVIRON="$(tr '\0' '\n' < /proc/${PID}/environ | grep "DBUS_SESSION_BUS_ADDRESS" | cut -d "=" -f 2-)"
	export DBUS_SESSION_BUS_ADDRESS="${QUERY_ENVIRON}"
fi

if [ -z "${DISPLAY-}" ]; then
	export DISPLAY=`awk 'BEGIN{FS="="; RS="\0"}  $1=="DISPLAY" {print $2; exit}' /proc/${PID}/environ`
fi

echo " ==> Install yedit Eclipse plugin ..."
eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/mars/,http://dadacoalition.org/yedit -installIU org.dadacoalition.yedit.feature.feature.group

nohup nemo -n & # Invoking the nemo file manager to get the desktop to update.

echo " ==> Setting nemo file manager preferences ..."
gsettings set org.nemo.list-view default-visible-columns "['name', 'size', 'type', 'date_modified', 'owner', 'group', 'permissions']"
gsettings set org.nemo.preferences default-folder-viewer 'list-view'
gsettings set org.nemo.preferences show-advanced-permissions true
gsettings set org.nemo.preferences show-computer-icon-toolbar true
gsettings set org.nemo.preferences show-full-path-titles true
gsettings set org.nemo.preferences show-hidden-files true
gsettings set org.nemo.preferences show-home-icon-toolbar true
gsettings set org.nemo.preferences show-location-entry true
gsettings set org.nemo.preferences show-new-folder-icon-toolbar true
gsettings set org.nemo.preferences show-open-in-terminal-toolbar true
gsettings set org.nemo.preferences show-reload-icon-toolbar true
gsettings set org.nemo.window-state side-pane-view 'tree'
