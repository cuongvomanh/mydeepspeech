rm -rf input/*
while true;do
    if [[ $rt == 'false' ]];then
        fp=input/`ls input/ | sort | head -n 1`
    else
        fp=input/`ls input/ | sort | tail -n 1`
    fi
    op="output/$(echo $fp | sed 's#^input/##g').txt"
    if [[ $fp != 'input/' ]];then
        env/bin/deepspeech --model models/output_graph.pbmm --alphabet models/alphabet.txt --lm models/lm.binary --trie models/trie --audio $fp > $op
        rm -rf $fp
    fi
done

while true;do
    timeout 5 sox -t alsa default test.wav; mv test.wav input/$(date +"%Y%m%d%H%M%S").wav
done


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
