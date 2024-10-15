export GPG_TTY=$(tty)

if [ "$XDG_CURRENT_DESKTOP" = "Sway" ] ; then
	QT_QPA_PLATFORMTHEME=qt5ct
	export QT_QPA_PLATFORMTHEME
fi
