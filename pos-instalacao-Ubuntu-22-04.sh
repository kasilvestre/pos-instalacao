#!/bin/bash


## Criando diretorio Programas onde vao
## ficar os programaas que precisao de
## dwonloads para serem istalados
mkdir /home/$USER/Downloads/Programas/

## Criando diretorio .icons
mkdir /home/$USER/.icons/

## Criando diretorio .themes
mkdir /home/$USER/.themes/

## Criando diretorio Temp
mkdir /home/$USER/Temp/

## Instalar software de terceiros
sudo apt install -y ubuntu-restricted-extras

## Entrando na para pasta de programas
cd /home/$USER/Downloads/Programas/


## E nescessario instalar os compactadores
## e descompactadores aqui, porque
## logo em seguida alguns
## arquivos vao ser descompactados
sudo apt update -y
sudo apt install -y sharutils
sudo apt install -y p7zip-full p7zip-rar lzma lzma-dev rar unrar-free p7zip ark ncompress


## Instalando comando curl
sudo apt install -y curl


## Download Atom
echo -e "\n\n\n Atom"
if [ -e atom-amd64.deb ];then
    echo "O arquivo  atom-amd64.deb  ja existe"
else
    curl -L -o atom-amd64.deb https://www.dropbox.com/s/gll306i9cjwgg15/atom-amd64.deb?dl=0
fi


## Download Chrome
echo -e "\n\n\n Chrome"
if [ -e chrome-stable_current_amd64.deb ];then
    echo "O arquivo  chrome-stable_current_amd64.deb  ja existe"
else
    curl -L -o chrome-stable_current_amd64.deb https://www.dropbox.com/s/l620466htoiazpd/chrome-stable_current_amd64.deb?dl=0
fi


## Download Microsoft Teams
echo -e "\n\n\n Microsoft Teams"
if [ -e teams_1.5.00.23861_amd64.deb ];then
    echo "O arquivo  teams_1.5.00.23861_amd64.deb  ja existe"
else
    curl -L -o teams_1.5.00.23861_amd64.deb https://www.dropbox.com/s/3fuxgq4hd6ks0lo/teams_1.5.00.23861_amd64.deb?dl=0
fi


## Download Only OFfice
echo -e "\n\n\n Only Office"
if [ -e onlyoffice-desktopeditors_amd64.deb ];then
    echo "O arquivo  onlyoffice-desktopeditors_amd64.deb  ja existe"
else
    curl -L -o onlyoffice-desktopeditors_amd64.deb https://www.dropbox.com/s/umn658a65ypprjp/onlyoffice-desktopeditors_amd64.deb?dl=0
fi


## Download Zoom
echo -e "\n\n\n Zoom"
if [ -e zoom_amd64.deb ];then
    echo "O arquivo  zoom_amd64.deb  ja existe"
else
    curl -L -o zoom_amd64.deb https://www.dropbox.com/s/17tj4o7yz4r1bv1/zoom_amd64.deb?dl=0
fi


## Download Wallpapers
echo -e "\n\n\n Wallpapers"
if [ -d /home/$USER/Imagens/wallpaper ];then
    echo "O diretorio  /home/$USER/Imagens/wallpaper  ja existe"
else
    curl -L -o wallpaper.tar.xz https://www.dropbox.com/s/k8gtt9y36q6rs0x/wallpaper.tar.xz?dl=0

    tar xvf wallpaper.tar.xz
    cp -r wallpaper /home/$USER/Imagens/
    rm wallpaper.tar.xz
fi


## Download tema WhiteSur Dark solid
echo -e "\n\n\n WhiteSur Dark solid"
if [ -e /home/luciano/.themes/WhiteSur-dark-solid ];then
    echo "O diretorio  /home/luciano/.themes/WhiteSur-dark-solid  ja existe"
else
    curl -L -o WhiteSur-dark-solid.tar.xz https://www.dropbox.com/s/72h6xx5hwn3827a/WhiteSur-dark-solid.tar.xz?dl=0

    tar xvf WhiteSur-dark-solid.tar.xz
    cp -r WhiteSur-dark-solid /home/$USER/.themes/
    rm WhiteSur-dark-solid.tar.xz
fi


## Download icones White Sur
echo -e "\n\n\n White Sur Icons"
if [ -e /home/luciano/.icons/WhiteSur ];then
    echo "O diretorio  /home/luciano/.icons/WhiteSur  ja existe"
else
    curl -L -o WhiteSur.tar.xz https://www.dropbox.com/s/o128bwexaeowpa8/WhiteSur.tar.xz?dl=0

    tar xvf WhiteSur.tar.xz
    cp -r WhiteSur /home/$USER/.icons/
    rm WhiteSur.tar.xz
fi



echo -e "\n\n\n************************************************** INSTALACAO DO JDK-17 **************************************************************"

## Download JDK-17
echo -e "\n\n\n JDK"
if [ -d jdk-17 ];then
    sudo cp -r jdk-17 /opt/
else
    curl -L -o openjdk-17_35_linux-x64_bin.tar.gz https://www.dropbox.com/s/6bxeupxawfk9wlc/openjdk-17_35_linux-x64_bin.tar.gz?dl=0

    tar xvzf openjdk-17_35_linux-x64_bin.tar.gz
    sudo cp -r jdk-17 /opt/
    rm openjdk-17_35_linux-x64_bin.tar.gz
fi


## Selecionando qual versão do java vai ser a padrao
sudo update-alternatives --install /usr/bin/java java /opt/jdk-17/bin/java 2
sudo update-alternatives --config java


## Configurando variaveis de ambiente do Java
if grep -qi "export JAVA_HOME=/opt/jdk-17" /home/$USER/.bashrc; then
    echo "Variaveis de ambiente Java ja configurados"
else
    echo "export JAVA_HOME=/opt/jdk-17" >> /home/$USER/.bashrc
    echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> /home/$USER/.bashrc
fi

## Usando o comando source para executar o arquivo .bashrc
source /home/luciano/.bashrc

echo "***********************************************************************************************************************************************"



echo -e "\n\n\n************************************************** INSTALANDO  APLICATIVOS  APT ******************************************************"

## Atualizando PPA
sudo apt update -y

## Instalando Hardinfo
sudo apt install -y hardinfo

## Instalando fontes da Microsoft
sudo apt install -y ttf-mscorefonts-installer
sudo fc-cache -f -v

## Instalando gcc g++
sudo apt install -y gcc g++ make

## Instalando o Transmission
sudo apt install -y transmission

## Intalando Gnome tweaks tools
sudo apt install -y gnome-tweak-tool

## Instalando net-tools
sudo apt install -y net-tools

## Instalando libglib2.0-dev
sudo apt install -y libglib2.0-dev

## Instalando libgconf-2-4
sudo apt install -y libgconf-2-4

## Instalando VLC
sudo apt install -y vlc

## Instalando Browser Epiphany
sudo apt install -y epiphany-browser

## Instalando Gnome extensions
sudo apt install -y gnome-shell-extensions
sudo apt install -y chrome-gnome-shell

## Instalando o gerenciador de extensões
sudo apt install -y gnome-shell-extension-manager

## Instalando Kolourpaint
sudo apt install -y kolourpaint

## Instalando o Dconf-editor
sudo apt install -y dconf-editor

## Instalando Gparted
sudo apt install -y gparted

## Instalando Okular
sudo apt-get install -y okular

echo  "**********************************************************************************************************************************************"



echo -e "\n\n\n************************************************** INSTALANDO  ARQUIVOS  .DEB ********************************************************"

## Voltando para pasta de programas
cd /home/$USER/Downloads/Programas/


sudo apt update -y


## Tornando todos os arquivos .deb
## em arquivos executavies
chmod +x *.deb


## Atom
sudo dpkg -i atom-amd64.deb
sudo apt --fix-broken install -y


## Chrome
sudo dpkg -i chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y


## Microsoft Teams
sudo dpkg -i teams_1.5.00.23861_amd64.deb
sudo apt --fix-broken install -y


## Only Office
sudo dpkg -i onlyoffice-desktopeditors_amd64.de
sudo apt --fix-broken install -y


## Zoom
sudo dpkg -i zoom_amd64.deb
sudo apt --fix-broken install -y

echo "***********************************************************************************************************************************************"
