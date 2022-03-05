echo " 
🄲🅁🄴🄰🅃🄴🄳 🄱🅈
╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱
╭━━━╮╱╱╭━━━┳╮╱╱╭╮╭╮╭━━━╮
┃╭━╮┃╱╱┃╭━╮┃┃╱╱┃┃┃┃┃╭━╮┃
┃┃╱┃┣━━╋╯╭╯┃┃╭┳┫┃┃┃╰╯╭╯┣━╮
┃╰━╯┃╭━╋╮╰╮┃╰╯╋┫┃┃┃╭╮╰╮┃╭╯
┃╭━╮┃╰━┫╰━╯┃╭╮┫┃╰┫╰┫╰━╯┃┃
╰╯╱╰┻━━┻━━━┻╯╰┻┻━┻━┻━━━┻╯"
echo "
=========================================================
[+] This script is only for HP 245 g6.
[+] OS version Debian 11.
[+] Make your the above infor matches with your sys conf.
========================================================="
echo "[+] Installing applications"
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
echo "
=========================
[+] Installing Terminator
========================="
if which terminator >/dev/null; then
    echo "Checked: Installed!"
else
    echo "Installing"
    sudo apt install terminator -y 
fi

echo "
=========================
[+] Installing Gparted
========================="
if which gparted >/dev/null; then
    echo "Checked: Installed!"
else
    echo "Installing"
    sudo apt install gparted -y 
fi

echo "
=========================
[+] Installing Terminator
========================="
if which terminator >/dev/null; then
    echo "Checked: Installed!"
else
    echo "Installing"
    sudo apt install terminator -y 
fi
echo "
======================
[+] Installing Python3
======================"
if which python3 >/dev/null; then
    echo "Checked: Installed!"
else
    echo "Installing"
    sudo apt install python3 -y 
fi
echo "
======================
[+] Installing Python3-pip
======================"
if which python3-pip >/dev/null; then
    echo "Checked: Installed!"
else
    echo "Installing"
    sudo apt install python3-pip -y 
fi
echo "
======================
[+] Installing Python3-venv
======================"
if which python3-venv >/dev/null; then
    echo "Checked: Installed!"
else
    echo "Installing"
    sudo apt install python3-venv -y 
fi

echo "
======================
[+] Installing GIT
======================"
if which git >/dev/null; then
    echo "Checked: Installed!"
else
    echo "Installing"
    sudo apt install git -y 
fi

echo "
======================
[+] Installing Curl
======================"
if which curl >/dev/null; then
    echo "Checked: Installed!"
else
    echo "Installing"
    sudo apt install curl -y 
fi

echo "
=========================
[+] Installing VS Code
========================="
echo "
-------------------------------------------
Adding Microsoft Visual Studio Code GPG Key
-------------------------------------------"
curl -sSL https://packages.microsoft.com/keys/microsoft.asc -o microsoft.asc
gpg --no-default-keyring --keyring ./ms_vscode_key_temp.gpg --import ./microsoft.asc
gpg --no-default-keyring --keyring ./ms_vscode_key_temp.gpg --export > ./ms_vscode_key.gpg
sudo mv ms_vscode_key.gpg /etc/apt/trusted.gpg.d/
echo "
--------------------------------------
Adding VS Code Repository on Debian 11
--------------------------------------"
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
echo "
---------------------------
Running package list update
---------------------------"
sudo apt update
echo "
------------------------------------
Diploying command to install VS code
------------------------------------" 
fi

echo "
======================
[+] Installing VLC
======================"
if which vlc >/dev/null; then
    echo "Checked: Installed!"
else
    echo "Installing"
    sudo apt install vlc -y 
fi

echo "
======================
[+] Installing bleachbit
======================"
if which bleachbit >/dev/null; then
    echo "Checked: Installed!"
else
    echo "Installing"
    sudo apt install bleachbit -y 
fi

echo "
==================================================
[+] Downloading wireless drivers rtw88 from github
=================================================="
echo "
--------------------
Updating Pakege list
--------------------"
sudo apt update
echo "
-------------------------------------------------------------
Installing make gcc linux-headers-$(uname -r) build-essential
-------------------------------------------------------------"
sudo apt-get install make gcc linux-headers-$(uname -r) build-essential
cd Downloads
git clone https://github.com/lwfinger/rtw88.git
cd rtw88
make
sudo make install
sudo modprobe -r rtw_8723de
sudo modprobe rtw_8723de
echo "[+] Wireless driver installation done!!"
echo "[+] ==================================="
echo "[+] Please restart manually"
echo "[+] ======================="
cd
echo "[+] Installing AMDgpu"
sudo apt update
sudo apt purge *nvidia*
echo "[+] Adding repo"
echo "deb http://deb.debian.org/debian buster main contrib non-free" | sudo tee -a /etc/apt/sources.list
sudo apt update
echo "[+] Installing Packages"
sudo apt install firmware-amd-graphics libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all
sudo apt --fix-broken install
echo "[+] Finished"
echo "
****************
[+] RESTART NOW (sudo reboot)
****************"