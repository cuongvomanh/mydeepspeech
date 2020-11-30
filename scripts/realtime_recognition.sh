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

