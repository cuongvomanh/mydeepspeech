timeout 5 sox -t alsa default output.wav
env/bin/deepspeech --model models/output_graph.pbmm --alphabet models/alphabet.txt --lm models/lm.binary --trie models/trie --audio output.wav

