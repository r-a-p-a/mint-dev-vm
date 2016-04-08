#!/bin/bash

#export DEBIAN_FRONTEND=noninteractive
   
echo " ==> Silence the dpkg 'Unable to re-open stdin' warning messages"
ex +"%s@DPkg@//DPkg" -cwq /etc/apt/apt.conf.d/70debconf
dpkg-reconfigure debconf -f noninteractive -p critical

apt="apt-get -qq -y"

$apt install pv
echo " ==> Installed pv"
$apt install geany
echo " ==> Installed geany as an alternative editor to gedit"


echo " ==> about to wget eclipse ..."
mkdir /opt/eclipse
E_P="jee"   # Eclipse Package
E_R="mars"  # Eclipse Release
E_V="2"     # Eclipse Version
wget -qO- \
	"http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/${E_R}/${E_V}/eclipse-${E_P}-${E_R}-${E_V}-linux-gtk-x86_64.tar.gz&r=1" \
	| pv --interval 5 --force -r -b | tar xz -C /opt
echo " ==> Downloaded and extracted Eclipse to /opt/eclipse"
ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse
mv /tmp/files/eclipse.desktop /usr/share/applications/eclipse.desktop
mkdir -p /opt/eclipse/configuration/.settings
mv /tmp/files/eclipse-org.eclipse.ui.ide.prefs /opt/eclipse/configuration/.settings/org.eclipse.ui.ide.prefs
chown -R vagrant:users /opt/eclipse
chmod -R g+w /opt/eclipse

# Set the default workspace for Eclipse to /opt/workspace to allow easier scripted configuration, etc
mkdir -p /opt/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings
mv /tmp/files/org.eclipse.* /opt/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/
sed -i 's|^osgi.instance.area.default.*|osgi.instance.area.default=/opt/workspace|' /opt/eclipse/configuration/config.ini
chown -R vagrant:users /opt/workspace
chmod -R g+w /opt/workspace

echo " ==> about to wget VS Code ..."
VSCODE_TMP="VSCode-linux-x64.zip"
wget "https://vscode-update.azurewebsites.net/latest/linux-x64/stable" -O $VSCODE_TMP && unzip -d /opt $VSCODE_TMP && rm $VSCODE_TMP 
echo " ==> Downloaded and extracted MS Visual Studio Code to /opt/VSCode-linux-x64"
ln -s /opt/VSCode-linux-x64/code /usr/local/bin/code
mv /tmp/files/vscode.desktop /usr/share/applications/vscode.desktop