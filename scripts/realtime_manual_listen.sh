timeout 5 sox -t alsa default test.wav; mv test.wav input/$(date +"%Y%m%d%H%M%S").wav
