all: hvsync_generator

hvsync_generator: 
	make -C video_signal_generator all

.PHONY: clean 

clean:
	make -C video_signal_generator clean