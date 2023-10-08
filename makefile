all: hvsync-generator test-video-signal-generator 

hvsync-generator: 
	make -C hvsync_generator

test-video-signal-generator: 
	make -C test_video_signal_generator

.PHONY: clean 

clean:
	make -C hvsync_generator clean
	make -C test_video_signal_generator clean