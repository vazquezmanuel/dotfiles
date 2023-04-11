# Mis configuraciones

Para obtener esta configuración, primero es recomendable tener una instalación limpia de Arcolinux B, con qtile como manejador de ventanas. Las particiones que instalé se describen a continuación:
| Tamaño | Sistema de ficheros | Punto de montaje | Bandera |
|--------|---------------------|------------------|---------|
| 110 GB |        ext4         |        /         |  root   |
|  8 GB  |      linuxswap      |                  |  swap   |
| 472 GB |        ext4         |      /home       |         |
|        |    fat partition    |    /boot/efi     |         |

Esta última partición ya ha sido creado por windows, en caso de que este haciendo un dual boot, por lo que solo hay que especificar el punto de montaje.
Una vez dentro del sistema se abre una terminal (con la combinación de teclas `mod + Enter`) y se actualizan los programas mediante:

```
sudo pacman -Syyu
```

Y para obtener mis configuraciones se debe ejecutar:

```
cd ~
git clone https://github.com/vazquezmanuel/dotfiles
./dotfiles/.scripts/configure
```

Actualmente, he tenido problemas descargando el programa [xfce4-volumed-pulse](https://aur.archlinux.org/packages/xfce4-volumed-pulse) (para el control de audio en laptops) por medio de paru, por lo que su intalación se hará por medio del siguiente scripts:

```
~/.scripts/xfce4-volumed-pulse-install
```

Listo, ahora tiene mis archivos de configuración, bastará con reinciar la computadora para que se vean aplicados todos los cambios, sin embargo, en está configuración tengo algunos comandos que requieren de determinadas aplicaciones (`ssn`, `sr` o `vim`, los cuales puedes modificar fácilmente en el archivo `~/.config/fish/config.fish`).
Cabe aclarar que la configuración de qtile fue tomada de [la configuración de Antonio Sarosi](https://github.com/antoniosarosi/dotfiles), recomiendo leer su documentación para conocer algunos comandos.

## Aplicaciones
Arcolinux B viene sin algunas aplicaciones necesarias para cualquier usuario, como un visor de pdf, de audio, vídeo, etc. Mi recomendación es instalar lo siguiente:

```
sudo pacman -S vlc kdenlive darktable audacity
sudo pacman -S code
sudo pacman -S texlive-most texlive-latexextra texlive-science texlive-pictures
paru -S sioyek
paru -S youtube youtube-music-bin
paru -S firefox-gnome-theme-git
```

O ejecutar el comando `~/.scripts/myapps`.

Para el caso de laptops, se puede optimizar el uso de la bateria desinstalando tlp (`sudo pacman -Rns tlp`) e instalar [auto-cpufreq](https://github.com/AdnanHodzic/auto-cpufreq).

Como editor de texto por defecto, uso [lunarvim](https://www.lunarvim.org) (la configuración de fish ya ha sido establecida para abrir lunarvim al escribir el comando `vim`; recomiendo instalar lunarvim teniendo una versión de nodejs instalado a partir de nvm, ejecutado a través de bash), después de instalarlo copiaremos mi configuración (el cual está definido para el uso de python, markdown y LaTeX) con los siguientes comandos.

```
cd ~
mv .config/lvim .bak/.config/
mv dotfiles/.config/lvim .config/
```

Para el manejo de versiones de python usaré pyenv, el cual se instala mediante
```
sudo pacman -S pyenv
```

## Personalizando las aplicaciones

Para personalizar la mayoria de las aplicaciones basta con editar la apariencia mediante `kvantun manager`, entre a la aplicación y seleccione un tema que sea de su agrado.
Para las aplicaciones que usen Qt5, primero hay que instalar dos aplicaciones mediante `sudo pacman -S lxappearance qt5ct`, ahora ya puede entrar a la aplicación lxappearance y cambiar el tema.
Otro cambio que hice fue el instalar [sddm-sugar-candy](https://github.com/Kangie/sddm-sugar-candy) ([para arch](https://aur.archlinux.org/packages/sddm-sugar-candy-git)); para configurarlo, entre a la aplicación Arch Linux Tweak Tool y cambie el tema por defecto. Le hice algunas modificaciones al tema, para obtener los cambios ejecute lo siguiente:
```
sudo cp ~/.scripts/theme.conf /usr/share/sddm/themes/sugar-candy/
~/.scripts/sddmbg
```

Por último, personalice firefox con [firefox-gnome-theme](https://github.com/rafaelmardojai/firefox-gnome-theme) (ya se ha instalado con el script *myapps*).


## Fondos de pantallas

Se podrá haber dado cuenta de que tiene una carpeta con más de 300 fondos de pantalla ubicada en `~/Wallpapers/`; con el script `~/.scripts/fehbg`, que se ejecuta en cada inicio de sesión, se toma una imagen aleatoria y la pone como fondo de pantalla. De igual manera el archivo ubicado en `~/.scripts/sddmbg` cambia el fondo de pantalla de cada inicio de sesión (en el caso de usar sddm-sugar-candy), este script se ejecuta al reiniciar o apagar la computadora con los comandos `sr` o `ssn`, respectivamente. Por último, para configurar el fondo de bloqueo de pantalla se ejecuta `betterlockscreen -u ~/Wallpapers`

# TODO
* Readme: versión en inglés y documentar mejor
* Configurar multiples monitores
* Mi propia versión de [Pycritty](https://github.com/antoniosarosi/pycritty), extendiendolo al tema de lunarvim y de qtile.
