echo "modify hostname..."
sudo echo "10.0.2.15 vhcalnplci vhcalnplci.dummy.nodomain" > /etc/hosts

echo "install tcsh..."
zypper --non-interactive --gpg-auto-import-keys in --auto-agree-with-licenses tcsh

echo "chmod install.sh..."
if [ -f /vagrant/sap_netweaver_as_abap_750_sp02_ase_dev_edition/install.sh ]
then
  chmod +x /vagrant/sap_netweaver_as_abap_750_sp02_ase_dev_edition/install.sh
fi
