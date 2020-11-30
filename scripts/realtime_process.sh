#!/bin/bash
rop=output/`ls output/ | sort | tail -n 1`
while true;do
    op=output/`ls output/ | sort | tail -n 1`
    if [[ $op != $rop ]] ;then
        echo "op "$op
        echo "rop "$rop
        sleep 5
        head "$op"
        cat $op
        if [[ $do_cm == 'true' ]];then
            #qr=`cat $op`;$(cat ~/.zsh_history | awk -F\; '{print $NF}' | fzf -1 --query=$qr)
            qr=`cat $op`;
            if [[ $qr != '' || $is_t == 'true' ]] ;then 
                timeout 5 fzf -1 --query=$qr < ~/.BOTSH | xargs -I {} gnome-terminal -e {}

            fi
        fi
        #cat output/*
        rop=$op
    fi
done

