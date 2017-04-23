echo "install Gnome..."
sudo zypper ar obs://GNOME:STABLE:3.0/openSUSE_11.4 GNOME:STABLE:3.0
sudo zypper mr -p 98 -r GNOME:STABLE:3.0
sudo zypper dup --from GNOME:STABLE:3.0
zypper install gnome-shell metatheme-adwaita-common gnome-shell-lang gnome-desktop-lang
zypper --non-interactive install --force-resolution --no-confirm --auto-agree-with-licenses patterns-openSUSE-gnome

sudo sed -i 's/"sddm"/"gdm"/g' /etc/sysconfig/displaymanager
sudo echo "/usr/bin/Xorg                 root:root       4711" >> /etc/permissions.local
sudo chkstat --system --set

echo "install JAVA..."
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.rpm
sudo zypper --non-interactive remove --force-resolution java
sudo ln -s /usr/sbin/update-alternatives /usr/sbin/alternatives
sudo rpm -ivh --nodeps jdk-8u101-linux-x64.rpm
sudo update-alternatives --set java /usr/java/jdk1.8.0_101/jre/bin/java
rm jdk-8u101-linux-x64.rpm