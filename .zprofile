export GPG_TTY=$(tty)

if [ x"$XDG_CURRENT_DESKTOPc" = x"Sway" ] ; then
	QT_QPA_PLATFORMTHEME=qt54ct
	export QT_QPA_PLATFORMTHEME
fi
