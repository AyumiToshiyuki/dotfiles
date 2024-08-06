export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

# Autostart Xorg if on tty1
if [ "$(tty)" = "/dev/tty1" ]; then
	#exec startx
fi
