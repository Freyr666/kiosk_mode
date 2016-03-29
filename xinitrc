
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export GDK_SCALE=2
#starting compose mgr
xcompmgr &
#starting pulseaudio
pulseaudio -D &
#turning screen blanking off
xset s off &
#setting cursor theme
xsetroot -cursor_name left_ptr &

exec ats.sh
