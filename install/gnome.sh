echo "install Gnome..."
sudo zypper ar obs://GNOME:/STABLE:/3.16/openSUSE_13.2/GNOME:STABLE:3.16
sudo zypper mr -p 98 -r GNOME:STABLE:3.16
sudo zypper dup --from GNOME:STABLE:3.16
zypper install gnome-shell metatheme-adwaita-common gnome-shell-lang gnome-desktop-lang
zypper --non-interactive install --force-resolution --no-confirm --auto-agree-with-licenses patterns-openSUSE-gnome

sudo sed -i 's/"sddm"/"gdm"/g' /etc/sysconfig/displaymanager
sudo echo "/usr/bin/Xorg                 root:root       4711" >> /etc/permissions.local
sudo ln -svf /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target
sudo chkstat --system --set

echo "install JAVA..."
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-x64.rpm
sudo zypper --non-interactive remove --force-resolution java
#sudo ln -s /usr/sbin/update-alternatives /usr/sbin/alternatives
sudo zypper --non-interactive in --auto-agree-with-licenses /home/vagrant/jdk-8u66-linux-x64.rpm
#sudo rpm -ivh --nodeps jdk-8u152-linux-x64.rpm
#sudo update-alternatives --set java /usr/java/jdk1.8.0_152/jre/bin/java
#rm jdk-8u152-linux-x64.rpm