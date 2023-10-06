video_signal_generator: 
	make -C video_signal_generator

all: video_signal_generator

.PHONY: clean

clean:
	make -C video_signal_generator clean