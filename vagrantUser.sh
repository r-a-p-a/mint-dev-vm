#!/bin/bash

#export DEBIAN_FRONTEND=noninteractive

cp /usr/share/applications/eclipse.desktop ~/Desktop/eclipse.desktop
chmod +x ~/Desktop/eclipse.desktop

cp /usr/share/applications/vscode.desktop ~/Desktop/vscode.desktop
chmod +x ~/Desktop/vscode.desktop

echo " ==> Created desktop launchers"

echo " ==> Install yedit Eclipse plugin ..."
eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/mars/,http://dadacoalition.org/yedit -installIU org.dadacoalition.yedit.feature.feature.group
