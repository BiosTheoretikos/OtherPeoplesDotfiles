#!/usr/bin/env bash 
NCMP=$(mpc | grep "^\[playing\]" | awk '{print $1}')
NUM_NCMP=$(mpc | head -1 | wc -c )
S_NCMP=$(mpc | head -1 | head -c 30)

if [ "$NCMP" = "[playing]" ];then 
    if [ "$NUM_NCMP" -lt 30 ];then 
        echo -e " : $(mpc current) "
    else
        echo -e " : $S_NCMP..."
    fi
else
    echo -e " : Pause "
fi

filter() {
    echo -n '['
    tr '\n' ' ' | grep -Po '.*(?= \[playing\])|paused' | tr -d '\n'
    echo -n ']'
}

case $BLOCK_BUTTON in
1) mpc toggle | filter;; # play/pause
2) ;;
3) ;;
4) mpc next   | filter;;
5) mpc prev   | filter;;
esac
exit 0